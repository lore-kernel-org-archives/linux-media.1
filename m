Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E4B436378
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132359; cv=none; b=OWhueNMtpi6JKNpcxCEK3mfNium0dkbraIzA6rxSo53vJAFUzF3Re94oSbVkEDg8zRGNhQLTZGI6KPXh0WAsJQQw5vafXyxkMtCiwU7FL77DiEMH0kojieg2LE6F1HdtyaqB9Uunw/B+NDFKb0ZFN12Br0Sv1fuoxe6D6lUJC/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132359; c=relaxed/simple;
	bh=B5rWRBHmhjOQJeFtLKvK7c90SntAVIi/XV48agSg/JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljf/qe32Isw35XA+luD7xSvqQSXN8ZX6Ch0x9S0pr3rlQHCogNHI6jj+P/z9/ObOCXlWOo9S5i5mE7XxhQiaVPkbJ380lAuXmtoDjkwfaFeIcxW2oT3VjPQdHkOkyCuxpeJv4S41KvGug1csJJn4JdwOy6ImTOc+BQnujaQIpNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsaOkC6M; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsaOkC6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773132358; x=1804668358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B5rWRBHmhjOQJeFtLKvK7c90SntAVIi/XV48agSg/JI=;
  b=LsaOkC6MDrz1RiVAqde2DylUZmwEPK/gZi2SQHlbA/PQidYXUt6M4kRR
   EZ2S7vct2oMgrzHVrEqzsBeLabxf8wNPrWT7ycZ/BOlTYlIofpA7iUWPe
   cl/NJQPAvNqPXnpe5PScwhhBw4e/7tYIs9b3zQzf3eb2i2dpIkeR8Rz9x
   mBJmpLspBAfc7/lul0FhodiuYfLlWmIIwF2FGPvY5N+/910K3EVRGuJNP
   qG6f4KYyoPrs3PU4Lh94tOUJA2I5IyQ7B7ksaKmEW5BG52n0/hg1hDDub
   LdgquWomlOP20GLv2sAJgFlqoQs4eZp7FCYJ+P2UoZN5dDIGYm3o/ncn1
   Q==;
X-CSE-ConnectionGUID: NBb5+0DoSSaJMqfUWXJ7Yw==
X-CSE-MsgGUID: B7m4cAQwRTybZJThfvywAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84501771"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="84501771"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:54 -0700
X-CSE-ConnectionGUID: xNjRWi5KRi+IqDw/XUtUlw==
X-CSE-MsgGUID: 02Mst1rIRxKsMKnw6BI5/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224727710"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.26])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:45:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7D288121EC8;
	Tue, 10 Mar 2026 10:46:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vzsjH-00000004xnz-1YLn;
	Tue, 10 Mar 2026 10:46:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	laurent.pinchart@ideasonboard.com
Subject: [raw2rgbpnm PATCH v4 08/11] Add --stride (-S) option for setting stride
Date: Tue, 10 Mar 2026 10:46:14 +0200
Message-ID: <20260310084615.1183141-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Being able to set stride explicitly is useful in some cases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 raw2rgbpnm.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 0e0a5b1e63e9..9ec9f06de052 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -139,11 +139,11 @@ static const struct format_info *get_format_info(__u32 f)
 }
 
 /* Read and return image data at given width, height and format information. */
-static unsigned char *read_raw_data(char *filename, int width, int height,
+static unsigned char *read_raw_data(char *filename, unsigned int width,
+				    unsigned int height, unsigned int line_length,
 				    const struct format_info *info)
 {
 	/* Get file size */
-	unsigned int line_length;
 	unsigned int padding = 0;
 	unsigned char *b = NULL;
 	unsigned int i;
@@ -174,9 +174,9 @@ static unsigned char *read_raw_data(char *filename, int width, int height,
 	}
 
 	/* Read data */
-	b = xalloc((width*height*bpp+7)/8);
+	b = xalloc(line_length * height);
 	if (padding == 0) {
-		r = fread(b, (width*height*bpp+7)/8, 1, f);
+		r = fread(b, line_length * height, 1, f);
 		if (r != 1)
 			error("fread");
 	} else {
@@ -327,10 +327,11 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
 }
 
 static void raw_to_rgb(const struct format_info *info,
-		       unsigned char *src, int src_width, int src_height, unsigned char *rgb)
+		       unsigned char *src, int src_width, int src_height,
+		       unsigned int stride, unsigned char *rgb)
 {
 	unsigned char *tmp_src = NULL;
-	unsigned int src_stride = src_width * info->bpp / 8;
+	unsigned int src_stride = stride ?: src_width * info->bpp / 8;
 	unsigned int rgb_stride = src_width * 3;
 	unsigned char *src_luma, *src_chroma;
 	unsigned char *src_cb, *src_cr;
@@ -844,6 +845,7 @@ static struct option options[] = {
 	{ "help", no_argument, NULL, 'h', },
 	{ "high-bits", no_argument, NULL, 'g', },
 	{ "size", required_argument, NULL, 's', },
+	{ "stride", required_argument, NULL, 'S', },
 	{ "swap-rb", no_argument, NULL, 'w', },
 	{ 0 },
 };
@@ -855,13 +857,14 @@ int main(int argc, char *argv[])
 	char *file_in = NULL, *file_out = NULL;
 	int format = V4L2_PIX_FMT_UYVY;
 	const struct format_info *info;
+	unsigned int stride = 0;
 	int r;
 	char *algorithm_name = NULL;
 	int height = -1;
 	int width = -1;
 
 	for (;;) {
-		int c = getopt_long(argc, argv, "a:b:f:ghs:w", options, NULL);
+		int c = getopt_long(argc, argv, "a:b:f:ghs:S:w", options, NULL);
 		if (c==-1) break;
 		switch (c) {
 		case 'a':
@@ -920,6 +923,9 @@ int main(int argc, char *argv[])
 				exit(0);
 			}
 			break;
+		case 'S':
+			stride = strtoul(optarg, NULL, 10);
+			break;
 		case 'w':
 			swaprb = 1;
 			break;
@@ -943,12 +949,12 @@ int main(int argc, char *argv[])
 	}
 
 	/* Read, convert, and save image */
-	src = read_raw_data(file_in, width, height, info);
+	src = read_raw_data(file_in, width, height, stride, info);
 	printf("Image size: %ix%i, bytes per pixel: %i, format: %s\n",
 	       width, height, info->bpp, info->name);
 	dst = xalloc(width*height*3);
 
-	raw_to_rgb(info, src, width, height, dst);
+	raw_to_rgb(info, src, width, height, stride, dst);
 	printf("Writing to file `%s'...\n", file_out);
 	f = fopen(file_out, "wb");
 	if (!f) error("file open failed");
-- 
2.47.3

