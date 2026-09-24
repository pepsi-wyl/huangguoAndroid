.class Lio/flutter/plugins/imagepicker/ExifDataCopier;
.super Ljava/lang/Object;
.source "ExifDataCopier.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static setIfNotNull(Landroidx/exifinterface/media/ExifInterface;Landroidx/exifinterface/media/ExifInterface;Ljava/lang/String;)V
    .locals 1

    .line 142
    invoke-virtual {p0, p2}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 143
    invoke-virtual {p0, p2}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p2, p0}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method copyExif(Landroidx/exifinterface/media/ExifInterface;Landroidx/exifinterface/media/ExifInterface;)V
    .locals 105
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    const-string v103, "InteroperabilityIndex"

    const-string v104, "Orientation"

    const-string v0, "ImageDescription"

    const-string v1, "Make"

    const-string v2, "Model"

    const-string v3, "Software"

    const-string v4, "DateTime"

    const-string v5, "Artist"

    const-string v6, "Copyright"

    const-string v7, "ExposureTime"

    const-string v8, "FNumber"

    const-string v9, "ExposureProgram"

    const-string v10, "SpectralSensitivity"

    const-string v11, "PhotographicSensitivity"

    const-string v12, "ISOSpeedRatings"

    const-string v13, "OECF"

    const-string v14, "SensitivityType"

    const-string v15, "StandardOutputSensitivity"

    const-string v16, "RecommendedExposureIndex"

    const-string v17, "ISOSpeed"

    const-string v18, "ISOSpeedLatitudeyyy"

    const-string v19, "ISOSpeedLatitudezzz"

    const-string v20, "ExifVersion"

    const-string v21, "DateTimeOriginal"

    const-string v22, "DateTimeDigitized"

    const-string v23, "OffsetTime"

    const-string v24, "OffsetTimeOriginal"

    const-string v25, "OffsetTimeDigitized"

    const-string v26, "ShutterSpeedValue"

    const-string v27, "ApertureValue"

    const-string v28, "BrightnessValue"

    const-string v29, "ExposureBiasValue"

    const-string v30, "MaxApertureValue"

    const-string v31, "SubjectDistance"

    const-string v32, "MeteringMode"

    const-string v33, "LightSource"

    const-string v34, "Flash"

    const-string v35, "FocalLength"

    const-string v36, "MakerNote"

    const-string v37, "UserComment"

    const-string v38, "SubSecTime"

    const-string v39, "SubSecTimeOriginal"

    const-string v40, "SubSecTimeDigitized"

    const-string v41, "FlashpixVersion"

    const-string v42, "FlashEnergy"

    const-string v43, "SpatialFrequencyResponse"

    const-string v44, "FocalPlaneXResolution"

    const-string v45, "FocalPlaneYResolution"

    const-string v46, "FocalPlaneResolutionUnit"

    const-string v47, "ExposureIndex"

    const-string v48, "SensingMethod"

    const-string v49, "FileSource"

    const-string v50, "SceneType"

    const-string v51, "CFAPattern"

    const-string v52, "CustomRendered"

    const-string v53, "ExposureMode"

    const-string v54, "WhiteBalance"

    const-string v55, "DigitalZoomRatio"

    const-string v56, "FocalLengthIn35mmFilm"

    const-string v57, "SceneCaptureType"

    const-string v58, "GainControl"

    const-string v59, "Contrast"

    const-string v60, "Saturation"

    const-string v61, "Sharpness"

    const-string v62, "DeviceSettingDescription"

    const-string v63, "SubjectDistanceRange"

    const-string v64, "ImageUniqueID"

    const-string v65, "CameraOwnerName"

    const-string v66, "BodySerialNumber"

    const-string v67, "LensSpecification"

    const-string v68, "LensMake"

    const-string v69, "LensModel"

    const-string v70, "LensSerialNumber"

    const-string v71, "GPSVersionID"

    const-string v72, "GPSLatitudeRef"

    const-string v73, "GPSLatitude"

    const-string v74, "GPSLongitudeRef"

    const-string v75, "GPSLongitude"

    const-string v76, "GPSAltitudeRef"

    const-string v77, "GPSAltitude"

    const-string v78, "GPSTimeStamp"

    const-string v79, "GPSSatellites"

    const-string v80, "GPSStatus"

    const-string v81, "GPSMeasureMode"

    const-string v82, "GPSDOP"

    const-string v83, "GPSSpeedRef"

    const-string v84, "GPSSpeed"

    const-string v85, "GPSTrackRef"

    const-string v86, "GPSTrack"

    const-string v87, "GPSImgDirectionRef"

    const-string v88, "GPSImgDirection"

    const-string v89, "GPSMapDatum"

    const-string v90, "GPSDestLatitudeRef"

    const-string v91, "GPSDestLatitude"

    const-string v92, "GPSDestLongitudeRef"

    const-string v93, "GPSDestLongitude"

    const-string v94, "GPSDestBearingRef"

    const-string v95, "GPSDestBearing"

    const-string v96, "GPSDestDistanceRef"

    const-string v97, "GPSDestDistance"

    const-string v98, "GPSProcessingMethod"

    const-string v99, "GPSAreaInformation"

    const-string v100, "GPSDateStamp"

    const-string v101, "GPSDifferential"

    const-string v102, "GPSHPositioningError"

    filled-new-array/range {v0 .. v104}, [Ljava/lang/String;

    move-result-object v0

    .line 28
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 134
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    .line 135
    invoke-static {v2, v3, v1}, Lio/flutter/plugins/imagepicker/ExifDataCopier;->setIfNotNull(Landroidx/exifinterface/media/ExifInterface;Landroidx/exifinterface/media/ExifInterface;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    move-object/from16 v3, p2

    .line 138
    invoke-virtual/range {p2 .. p2}, Landroidx/exifinterface/media/ExifInterface;->saveAttributes()V

    return-void
.end method
