import 'dart:io';

import 'package:drive_labs/auth/bloc/auth_bloc.dart' hide FailureState, LoadingState, LoadedState;
import 'package:drive_labs/auth/data/auth_datasource.dart';
import 'package:drive_labs/auth/data/auth_repository.dart';
import 'package:drive_labs/auth/model/upload_document_request.dart';
import 'package:drive_labs/components/context_extension.dart';
import 'package:drive_labs/components/custom_button.dart';
import 'package:drive_labs/components/custom_loading_wrapper.dart';
import 'package:drive_labs/components/sharedPreferences_service.dart';
import 'package:drive_labs/constants/app_colours/app_colors.dart';
import 'package:drive_labs/constants/helpers.dart';
import 'package:drive_labs/constants/strings.dart';
import 'package:drive_labs/dashboard/dashboard_screen.dart';
import 'package:drive_labs/gen/assets.gen.dart';
import 'package:drive_labs/main.dart';
import 'package:drive_labs/procedures/data/procedures_datasource.dart';
import 'package:drive_labs/procedures/data/procedures_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'bloc/procedures_bloc.dart';

class LicensingProceduresScreen extends StatefulWidget {
  const LicensingProceduresScreen({super.key});

  @override
  State<LicensingProceduresScreen> createState() => _LicensingProceduresScreenState();
}

class _LicensingProceduresScreenState extends State<LicensingProceduresScreen> {
  // State variables to store the paths of the picked images
  String? _photoPath;
  String? _aadharPath;
  String? _ageProofPath;

  final ImagePicker _picker = ImagePicker();
  final prefs = PreferenceService().prefs;

  ProceduresBloc proceduresBloc = ProceduresBloc(ProcedureRepository(procedureDataSource: ProcedureDataSource()));
  bool showSpinner = false;

  /// Shows a bottom sheet with Camera and Gallery options.
  void _showImageSourceBottomSheet(Function(String) onImagePicked, String docType) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text('Gallery', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery, onImagePicked, docType);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: Text('Camera', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera, onImagePicked, docType);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Handles picking an image, updating the state, and triggering the API call.
  Future<void> _pickImage(ImageSource source, Function(String) onImagePicked, String docType) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          onImagePicked(pickedFile.path);
        });
        // Call the API with the selected file path and document type
        await uploadDocumentApiCall(pickedFile.path, docType);
      }
    } catch (e) {
      // Handle any errors, e.g., permissions denied
      print("Failed to pick image: $e");
      Helpers.showSnackBar(context, "Failed to pick image: $e", isError: true);
    }
  }

  /// Placeholder method for your API call.
  Future<void> uploadDocumentApiCall(String filePath, String docType) async {
    // This expects a single string, but the model `files` property is a list.
    // Let's correct this by wrapping it in a list.
    UploadDocumentRequest uploadDocumentRequest = UploadDocumentRequest(
      files: filePath,
      userId: prefs.getString(PreferenceString.prefsUserId).toString(),
    );

    print("$filePath %%%%%%%%%%%%% $docType");
    proceduresBloc.add(UploadDocumentEvent(uploadDocumentRequest, docType));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: LoadingWrapper(
        showSpinner: showSpinner,
        child: Stack(
          children: [
            Assets.images.programBg.image(width: context.width(), fit: BoxFit.cover),
            BlocConsumer<ProceduresBloc, ProceduresState>(
              bloc: proceduresBloc,
              listener: (context, state) {
                if (state is FailureState) {
                  setState(() => showSpinner = false);
                  Helpers.showSnackBar(context, state.error);
                }
                if (state is LoadingState) {
                  setState(() => showSpinner = true);
                }
                if (state is LoadedState) {
                  setState(() => showSpinner = false);
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        35.verticalSpace,
                        Text(
                          LabelString.labelLicensingProcedures,
                          style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.blackColor),
                        ),
                        10.verticalSpace,
                        _buildUploadTile(
                          initialImage: Assets.icons.licensing3.image(),
                          title: LabelString.labelUploadPhoto,
                          subtitle: "",
                          filePath: _photoPath,
                          // Use a new callback to handle the path update
                          onPathUpdated: (path) => setState(() => _photoPath = path),
                          docType: 'photo',
                        ),
                        _buildUploadTile(
                          initialImage: Assets.icons.licensing2.image(),
                          title: LabelString.labelAadhar,
                          subtitle: "(Front-Back)",
                          filePath: _aadharPath,
                          onPathUpdated: (path) => setState(() => _aadharPath = path),
                          docType: 'adhar',
                        ),
                        _buildUploadTile(
                          initialImage: Assets.icons.licensing1.image(),
                          title: LabelString.labelAgeProof,
                          subtitle: "(Birth Certificate)",
                          filePath: _ageProofPath,
                          onPathUpdated: (path) => setState(() => _ageProofPath = path),
                          docType: 'certificate',
                        ),
                        20.verticalSpace,
                        CustomButton(
                          text: LabelString.labelDone,
                          backgroundColor: AppColors.green,
                          textColor: AppColors.whiteColor,
                          onPressed: () {
                            // You can add validation here to ensure all files are uploaded
                            //navigationService.push(DashboardScreen());
                            if (_photoPath?.isEmpty ?? true) {
                              Helpers.showSnackBar(context, ErrorString.uploadPhotoErr, isError: true);
                            } else if (_aadharPath?.isEmpty ?? true) {
                              Helpers.showSnackBar(context, ErrorString.uploadAadharErr, isError: true);
                            } else if (_ageProofPath?.isEmpty ?? true) {
                              Helpers.showSnackBar(context, ErrorString.uploadAgeProofErr, isError: true);
                            } else {
                              navigationService.push(DashboardScreen());
                            }
                          },
                          borderColor: AppColors.blackColor,
                        ),
                        35.verticalSpace,
                        Text(
                          LabelString.labelSteps,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.blackColor),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadTile({
    required String title,
    required String subtitle,
    String? filePath,
    required Image initialImage,
    required Function(String?) onPathUpdated, // Callback now accepts nullable String
    required String docType, // Document type for API call
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(color: AppColors.transparent, borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (filePath != null) {
                        navigationService.push(FullScreenImageViewer(imagePath: filePath));
                      } else {
                        _showImageSourceBottomSheet((path) => onPathUpdated(path), docType);
                      }
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: filePath != null ? FileImage(File(filePath)) : null,
                      child: filePath == null ? initialImage : null,
                    ),
                  ),
                  // The "X" button to remove the image
                  if (filePath != null)
                    Positioned(
                      bottom: -1,
                      right: -8,
                      child: GestureDetector(
                        onTap: () {
                          // Call the callback with null to remove the image path
                          onPathUpdated(null);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(Icons.close, color: Colors.white, size: 16),
                        ),
                      ),
                    ),
                ],
              ),
              16.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.blackColor),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF1F2125)),
                    ),
                ],
              ),
            ],
          ),
        ),
        if (subtitle != "(Birth Certificate)")
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: Colors.black26, thickness: 1),
          ),
      ],
    );
  }
}

class FullScreenImageViewer extends StatelessWidget {
  final String imagePath;

  const FullScreenImageViewer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            // InteractiveViewer allows pinch-to-zoom
            child: InteractiveViewer(
              panEnabled: false, // Set to true if you want to allow panning
              minScale: 0.5,
              maxScale: 4,
              child: Image.file(File(imagePath)),
            ),
          ),
          // Close Button
          Positioned(
            top: 40.0,
            right: 20.0,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
