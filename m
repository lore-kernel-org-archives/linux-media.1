Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533003FB044;
	Fri, 17 Jul 2026 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286329; cv=none; b=GXotCFrNYrhNN9jGQ+S+RRtrSMQfaTOMSihVZnz+UKZC9a9Dl+JrXoni9LSc3Jfg0ZZaMvcybc/df7yeaOgaA8c28bH3Yk4JhLYL/+HqpmVN20jE8Zx3QUkwZ1Xqt0fym08U/gydFw/XeI8N3+V8jgjoLJMiRqguEQOmdI4VjsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286329; c=relaxed/simple;
	bh=7K/pUPlJAxq8jHgzhjQI/6JNCntPh12+FNHMxXRgEfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MC4Pnb+0eMkxjILPyyNsIriGMsy8qiyDeMO6Gc9gj5ZnExeawofIWC88XGOLu8GKE2swgPnpSntBY8LVipbTbs9xouZPUUWN8zIxpk0kN76ZYaW13/d3DFirXxEE76bBFP0OPuCEnqk8FPOqU0Jg6ASL7F0/sJ1/s+EfD1gUspw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XNvCvgfa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XNvCvgfa"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D0E78FA;
	Fri, 17 Jul 2026 13:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286265;
	bh=7K/pUPlJAxq8jHgzhjQI/6JNCntPh12+FNHMxXRgEfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XNvCvgfafh5ZW9DGR6Yp4RxoNclxSuPM4X8JwWCMJLwshqi4hLnfyy9trW7zhqJb5
	 Ww1PdbgdRoDwk7Ae86+nHWLOoRwtM5J81b+zuEjyBHY1J7RAJ1ZqYOBHMIvF3yrsfu
	 sk4g68qHeMeYaA/gN4KkPRJD6fVXbgk7e9qyT6dY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:34:18 +0530
Subject: [PATCH v3 3/9] platform/raspberrypi: vchiq-mmal: Support ISP
 parameters and stats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vchiq-isp-v3-3-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
In-Reply-To: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4826;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=7K/pUPlJAxq8jHgzhjQI/6JNCntPh12+FNHMxXRgEfI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgxWMrHIvcdl+MVw6HSNYrf1mKSqKOmT4tECC
 wxALITY+ReJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloMVgAKCRBD3pH5JJpx
 RYlcEACNDAF4NNyxpAxYsGzYs1M11p33nblYqOWmUlqvnKFxIdzDbfCt4PsxWO9FNgSaMhZyYAO
 4hwj/ZC6Te5KOofwsciEd8sufB7fLJBiirDtNUSOfOujmvws9iVND/0Md0Tn7PtfH5WpqKUtcn1
 7EGEBbYlnY20qVaKgneXo/ywnOAN1aDZpeMVW+FoG9Dl/ivrdh1rt/xTyKocUuxrshSwRY5EqP/
 Sh4G0V2aLKceomcgwhKbwKJS7h0aULqlnQ17WixjJpI+3nob1NSKCgnzhhDzzJfh7tq6Sqrcq3l
 LqRbgtcs3x7/g17IKp+9zz6pXtKxjpEa/1reuY+XYAAS+m+w6a2TrDYrw/dqNxxT6GMP8XZZ0dR
 AB3RgAnGVq2g9lOhcbu3EepQL0DKHrxGKiL07wxfuI5htEO95hHwRsFBXwJQbx9l/vWdbO7aHjQ
 SPmlk8CTkVIi5TZisoPC2Kpq+kzErWmpy+Mx6aZkm3+8RyKrjwhgHrfbGR9drkQAwuckutoshu3
 Wwcp+/usdI4KqpII+PyUk4OYIu4wTHX/Z/lCM9Au/53zy87emIwAKbtwj+VgQa8bNC88xblIO1M
 bWF4pRAXJUZIpvb3iBCtLW3n26V8T7MTqWbtHz6L3NIrmDWrOvNpiJSG8sMP/TeMHz3wRC6gFUi
 +LpOGtf4/zSl8hA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The ISP used on BCM2835 and derivative platforms is behind the VCHIQ
bus, where some parameters and statistics are accessed through the MMAL
layer.

So add the relevant structures, macros and enum values.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/mmal-encodings.h  |  4 ++
 include/linux/raspberrypi/mmal-parameters.h | 86 +++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
index e15ae7b24f73..eadf2e981408 100644
--- a/include/linux/raspberrypi/mmal-encodings.h
+++ b/include/linux/raspberrypi/mmal-encodings.h
@@ -73,6 +73,10 @@
  */
 #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
 
+/** ISP image statistics format
+ */
+#define MMAL_ENCODING_BRCM_STATS       MMAL_FOURCC('S', 'T', 'A', 'T')
+
 /* }@ */
 
 /** \name Pre-defined audio encodings */
diff --git a/include/linux/raspberrypi/mmal-parameters.h b/include/linux/raspberrypi/mmal-parameters.h
index a0cdd28101f2..6ae5a7a1932c 100644
--- a/include/linux/raspberrypi/mmal-parameters.h
+++ b/include/linux/raspberrypi/mmal-parameters.h
@@ -223,6 +223,64 @@ enum mmal_parameter_camera_type {
 	MMAL_PARAMETER_SHUTTER_SPEED,
 		/**< Takes a @ref MMAL_PARAMETER_AWB_GAINS_T */
 	MMAL_PARAMETER_CUSTOM_AWB_GAINS,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_SETTINGS_T */
+	MMAL_PARAMETER_CAMERA_SETTINGS,
+		/**< Takes a @ref MMAL_PARAMETER_PRIVACY_INDICATOR_T */
+	MMAL_PARAMETER_PRIVACY_INDICATOR,
+		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_STILLS_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_ANNOTATE_T */
+	MMAL_PARAMETER_ANNOTATE,
+		/**< Takes a @ref MMAL_PARAMETER_STEREOSCOPIC_MODE_T */
+	MMAL_PARAMETER_STEREOSCOPIC_MODE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_INTERFACE_T */
+	MMAL_PARAMETER_CAMERA_INTERFACE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_CLOCKING_MODE_T */
+	MMAL_PARAMETER_CAMERA_CLOCKING_MODE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_CONFIG_T */
+	MMAL_PARAMETER_CAMERA_RX_CONFIG,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_TIMING_T */
+	MMAL_PARAMETER_CAMERA_RX_TIMING,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_DPF_CONFIG,
+
+	/* 0x50 */
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_JPEG_RESTART_INTERVAL,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_CAMERA_ISP_BLOCK_OVERRIDE,
+		/**< Takes a @ref MMAL_PARAMETER_LENS_SHADING_T */
+	MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_BLACK_LEVEL,
+		/**< Takes a @ref MMAL_PARAMETER_RESIZE_T */
+	MMAL_PARAMETER_RESIZE_PARAMS,
+		/**< Takes a @ref MMAL_PARAMETER_CROP_T */
+	MMAL_PARAMETER_CROP,
+		/**< Takes a @ref MMAL_PARAMETER_INT32_T */
+	MMAL_PARAMETER_OUTPUT_SHIFT,
+		/**< Takes a @ref MMAL_PARAMETER_INT32_T */
+	MMAL_PARAMETER_CCM_SHIFT,
+		/**< Takes a @ref MMAL_PARAMETER_CUSTOM_CCM_T */
+	MMAL_PARAMETER_CUSTOM_CCM,
+		/**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
+	MMAL_PARAMETER_ANALOG_GAIN,
+		/**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
+	MMAL_PARAMETER_DIGITAL_GAIN,
+		/**< Takes a @ref MMAL_PARAMETER_DENOISE_T */
+	MMAL_PARAMETER_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_SHARPEN_T */
+	MMAL_PARAMETER_SHARPEN,
+		/**< Takes a @ref MMAL_PARAMETER_GEQ_T */
+	MMAL_PARAMETER_GEQ,
+		/**< Tales a @ref MMAP_PARAMETER_DPC_T */
+	MMAL_PARAMETER_DPC,
+		/**< Tales a @ref MMAP_PARAMETER_GAMMA_T */
+	MMAL_PARAMETER_GAMMA,
+		/**< Takes a @ref MMAL_PARAMETER_CDN_T */
+	MMAL_PARAMETER_CDN,
 };
 
 enum mmal_parameter_camera_config_timestamp_mode {
@@ -749,4 +807,32 @@ struct mmal_parameter_camera_info {
 				flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES];
 };
 
+enum mmal_parameter_ls_gain_format_type {
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U0P8_1 = 0,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_0 = 1,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_1 = 2,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_0 = 3,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_1 = 4,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_0 = 5,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_1 = 6,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U4P10  = 7,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_DUMMY  = 0x7FFFFFFF
+};
+
+struct mmal_parameter_lens_shading_v2 {
+	u32 enabled;
+	u32 grid_cell_size;
+	u32 grid_width;
+	u32 grid_stride;
+	u32 grid_height;
+	u32 mem_handle_table;
+	u32 ref_transform;
+	u32 corner_sampled;
+	enum mmal_parameter_ls_gain_format_type gain_format;
+};
+
+struct mmal_parameter_crop {
+	struct vchiq_mmal_rect rect;
+};
+
 #endif

-- 
2.54.0

