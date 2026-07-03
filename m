Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACA83B3BEB;
	Fri,  3 Jul 2026 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072518; cv=none; b=AnHy75lf7UQzvBcVDESCuDbCm1uCwHy/Bhom8IfJdnD9XE/bU+z1HOlioCtVnvUReIHf9OmXjqwOPrlw+iJIHPN2GkSek/AZUaVSmA9Clz9kb/RNWDr87yx6W4uaZeQsTZmC1WMwOUbMlgk2LmTP83q6QkVf6oHDDsQXE1X5cY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072518; c=relaxed/simple;
	bh=+a3qwhLl6b3h5N/hH8fGfzSJJtemMSkWiKUTHcVZcMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EPHSl7WuntzQyfK/TMo7wBvwzEOCEW05tpmBr7RmSpZqWLA9M+g6kLsaq6M1mfsJsGVMFY3yjzCU2X2YOfej4HE/nCNvyJw00UcaLV5ftZ/Ix/NuKP0LJ1i/A24p2qwybFiYfn/6D3n3OTxi2hPUewPisFsCJbJHUNZIbWcp5IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U9gAvh1N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U9gAvh1N"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31F9B11DD;
	Fri,  3 Jul 2026 11:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072459;
	bh=+a3qwhLl6b3h5N/hH8fGfzSJJtemMSkWiKUTHcVZcMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U9gAvh1N5I44ZMxp9iJ13HMf0Lfb0SySjbF2iEMOGeZhkWCWgf1mve2U4/lqECDQu
	 1oxVEYjQC0qkM6Yh4O3NId3tZsUN394SmiY+W3KoVeiAczUpcj2kRaYLplPjX7AoCm
	 +YzWhicRT62v9g9KzVMZI/p6eD/C5KvfHKstnNzY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 15:24:11 +0530
Subject: [PATCH RFC 06/10] media: uapi: Add metadata layout for IMX678
 embedded line
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-meta-v1-6-7c4924a0df05@ideasonboard.com>
References: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
In-Reply-To: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3461;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=+a3qwhLl6b3h5N/hH8fGfzSJJtemMSkWiKUTHcVZcMg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bPu5V7ZlFQjhMyofssvmE407fxHaOI3siym
 Q4cn1pMycqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeGzwAKCRBD3pH5JJpx
 RQP3D/9dZ3Wh1ikdchUx+bIh7gG29gB4gxS+vHD5SJR07AOPPMS/AgcrpJe/q1lhx7sSW38kC+P
 99M6lg6kvmBnYHtfaWss879UBZx+yZCmDfTnjNZrqHcaXq2czmhGVUMTROUmYAyVO7J+HTfWH1c
 Mtehuwv8piZ5kFZ8dBRhFZ2FcKCTADVQYww3T+RejxMmyULWdPAsceX/fkfpdOgozOPmYOLe+35
 q2HBIECL1BIdgFx9DviIkx4gmD9cqEvIuvdVraE0AvMj1FJjFraITeTaLbFG4S7WjtlCtoebjvm
 nPRqWKuMNbkHRp9qfoXpw3LxnyUYb134dr+DqyGQNxuITN9SwDH41WohS8x3j7+kY9wgB8tofPP
 V0QsfxIWxsX7S5TRv1TWuSvZQS5P6R/uDOXXqu4deuFG9nvdeudKrUrCTDVuixBEPnnrq27/FKA
 D6R4ryfiSL6UoIGkXAZtRbKmHGZQ5JuUDVwOIH3Iv3pV8wuGbEopXlb9QknosbUThGOmSJKlTUc
 0CUWwJKLyuGFIrZB6b8cw0hZyo8NinsHjcWbUmTyCjS6BJbenYhInCzmMO8dtbf3JdEI+7BrCWV
 WOrkhdG/hu19XEp1UNEjJDGSsisOXEhHXojE78loIf9aWgYlELtvikBcXwCYslQobZ3O7p0vxzl
 5YBiUrHCrrsqgfA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Add a metadata layout for Sony IMX678 camera sensor embedded line. Some
portions are transmitted as non-zero but not specified in the datasheet,
and are thus left undocumented.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../media/v4l/ext-ctrls-image-source.rst           |  3 ++
 .../userspace-api/media/v4l/metadata-layouts.rst   | 41 ++++++++++++++++++++++
 include/uapi/linux/v4l2-controls.h                 |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 14a3cadb2211..8e19fc73c926 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -181,6 +181,9 @@ Image Source Control IDs
     * - V4L2_METADATA_LAYOUT_OV2740
       - :ref:`OV2740 embedded data <media-metadata-layout-ov2740>`
       - 2
+    * - V4L2_METADATA_LAYOUT_IMX678
+      - :ref:`IMX678 embedded data <media-metadata-layout-imx678>`
+      - 3
 
 .. _image_source_control_binning_factors:
 
diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
index b4d04d82662b..f4254a82490e 100644
--- a/Documentation/userspace-api/media/v4l/metadata-layouts.rst
+++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
@@ -112,3 +112,44 @@ level 1.
     * - 89
       - 8
       - Frame counter (starts at 1, wraps to 0 after 255)
+
+Sony IMX678 Embedded Data Layout (``V4L2_METADATA_LAYOUT_IMX678``)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The Sony IMX678 camera sensor produces the following embedded data layout,
+indicated by ``V4L2_METADATA_LAYOUT_IMX678`` metadata layout. The format
+conforms to :ref:`CCS embedded data layout <media-metadata-layout-ccs>` up to
+level 1.
+
+Undocumented offsets till 170 may be ignored. From 171 to 288 all bytes are 00h
+and from 289 to line length all bytes are 07h.
+
+.. flat-table:: Sony IMX678 Embedded Data Layout. Octets at indices marked
+                ignored have been omitted from the table. Values for multi-byte
+                registers are in little-endian byte order.
+    :header-rows: 1
+
+    * - Offset
+      - Size in bits (active bits if not the same as size)
+      - Content description
+    * - 2
+      - 8 (6--0)
+      - CFMODE (6--5) | WINMODE (3--0)
+    * - 3
+      - 8 (5)
+      - HREVERSE
+    * - 9
+      - 8 (5)
+      - VREVERSE
+    * - 11
+      - 8 (7--6)
+      - ADBIT
+    * - 13
+      - 8 (3--0)
+      - MDBIT (3) | LANEMODE (2--0)
+    * - 24
+      - 24 (20--0)
+      - SHR0
+    * - 54
+      - 16 (12--0)
+      - BLKLEVEL
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 10b836ca938b..1a181ed2e0d5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1253,6 +1253,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 #define V4L2_METADATA_LAYOUT_CCS		1U
 #define V4L2_METADATA_LAYOUT_OV2740		2U
+#define V4L2_METADATA_LAYOUT_IMX678		3U
 
 #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
 #define V4L2_BINNING_FACTORS_MAKE(hnum, hdem, vnum, vdem)		\

-- 
2.54.0

