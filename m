Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610183;
	b=Sp2w2rmqOKlSgzgtHavDEz/x42R9wQpSY8p9FycPEpxmbhjA5Tkvo3XVB6/s+942w4Yc
	 Y/Yrfsbch2u0FE42AcvjjhGrWqj9ukvgpXHPj5wjBV2aFHQKxWTIiW6C/JPuOBkuH1fKI
	 Doi92pfQqWQWI0+Df1pi/klFlaKk6szrEOoFjQcZqoQiAkSUbVLM1hcRAkd+3CjYhCx46
	 O9TJhGXOPM+BC07+QOf0zmF8khPIw5Apq6wbjuFq0pGhcK7kO34K002xegZbQaduXGG1e
	 R9ZilYGCN44B2OUYJ3RRCgvugtGelmbYBkEhAyYAtswuexhiaM1PssAxah61Lvz0U+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610183;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uHHl/GCl/F0mlwbsU6ml//dSCBGul7kCInyCRlxEb6c=;
	b=hxJZNhSpKZtBUbRSE512GrriMtwBFat3W/NFRgxHXmxEQsLtDCE7uDF09rBb+NBV2LGi
	 Rhei5n2dlaFX/8dAvXZ2rfqxf1cmIUHvkKKj/3MQD2rHfujLq939mJsj5L64UV1kvXtFI
	 grsJU59g3OHmmRo2NL3GnehLLHZ2TBp12qVzK2wYdo59rslEVpEJ3BQ29vmgkJBcWQQC9
	 cKEXdsBPuDoJL5vEk9SQlaNFhsBaMuYWvUr/TrUuNR9mVAFETvd5cvAhKZpr+BcDQtzNT
	 D0tJOEner0G9hjXlAVTTIxCCSpCjXvTE/um9laTUX+figXjkUEsAxK0Tli+6BCd19ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=KFnl8hqo;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=M5Mm1+qd;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957CF606A319
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 957CF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=KFnl8hqo;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=M5Mm1+qd
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id CA480EC010F
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 15:16:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 21 Oct 2026 15:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792610181;
	 x=1792696581; bh=uHHl/GCl/F0mlwbsU6ml//dSCBGul7kCInyCRlxEb6c=; b=
	KFnl8hqoNhhTqco8v3WtcOvVHmAPWarm4gxe9YDlDi9bo4yoZN8adHETllfoCfxn
	AGWVEKmQSKU9I2JpzNWURiVHJAmkDzizeaRtuOslfHtIobTThl/kvk5rhDopDLBg
	qwdL+Ts19Ds8rWSYmrDD+e2E0n2eF9aY5xPdaPeTsRw2m0w3LSmYCv4fUGWIH6as
	i0qsOlj6YeCEOBgfXfWDrr/SUUqu7VJ5lHTWYaVB3jOM5GuxH69ezrvbsEmLYJaV
	7vY8BxxKVvh/942xA5BCeCQeJz9Xz2/HMG3MZRW13CecUXatgYyIanvwI3pmJn2+
	c6FvQdNv4yIYcSvWC6nW9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792610181; x=
	1792696581; bh=uHHl/GCl/F0mlwbsU6ml//dSCBGul7kCInyCRlxEb6c=; b=M
	5Mm1+qdh+qqFEWO5jOOUH43kVkgPCwmKTqyFLb9a4zxCBtU/eGazZqvyQHY766eN
	hVUioGNx48Y5m5CQ3iP7gwzPSNqiHAA1Mi3Hy2vjIby3GSfyPmHTRoMRrMnqIymq
	+JGULF12XzZomVpi23X2zPqH7/vTbYIEudPUjJaPEEEwkYkLb5hP+n/1YOb5Gw8c
	yKbjBWWnNEySpqPOOZy0qZGk/hCUUhdZka2/jWeYr4dAZNWCBR+g7OxgsCqjWrhD
	Ez7w6iXZXi3gqxfrzywbUU4taWJa0+GzbeJjVvRJUisBWNUEQBk0EVjimt9UX1bl
	pogQWVSL/SX1e9an4GO0g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792610181; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:aq64sKpQCgJzKMj3poIuw5J9FifbVmgWcetyN47qEkMJeEZ
	Z1LmvzwZVy4iYEPoyLiNr7Wcq7ObJ3MD4TL4tu3J84DnKm2tf+kflNIqhp9vtL5v
	XD4a5d8Gw/KU+CMMXcVHAZAFNR953uT+3WGfaMEteBn5af9E6M4YoJ9PWwF4LRls
	GO8DDlaxfcSLk+tVGrQ+637d9WKtOPuhIbd31MMZQ2OcmZj+TnunF99EWgCBNjfG
	p/iK0+490mqeI7LQMIaANTAcC81QAzBMdfwqo6Qizp8uZkDtlVlLThc+OoMbIml0
	Gr9Pp/PTjChAmvVQCNQjkcpONLZiOpYmwJCIW2w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Qnqo2VdQOQTpnUKnjhbJQElSJDOBjqgyBLSR2yfEmSU=:cRhmKNjxp9JqPc/8zBFnHNvTCgY7Ql2ElqIKYGXQFDg=;
X-ME-Sender: <xms:hQ_ZauBKQf7EQ1jv9drdGkUwHEtboI2DCVT9Xz3YFIIKcrabZEaziQ>
    <xme:hQ_ZamUvsgqGjwY3liEEPCtxqlGPykWa_ZEmYaxZSu5QHgLJQtDwqFdwV9BNLNElw
    1e_f6HbOVGshHDHmCSQxCnoQ49F6woJXJMTaNNEQU0SHnaLRSJlMBdU>
X-ME-Received: <xmr:hQ_ZasAh0JjfgPpAHN64mvlVpC_qacvNWuVtBc_kIbspKKrvefemmXOjM55d_AYY401OMcE020CKrTRvYLPVAzXf5DobCfs>
X-ME-Proxy-Cause: dmFkZTGY9wDDG53GH6vHIbrmNLtBm5dleI8NF8Il3SzYZ4lCC/E+Vg5flZ6k/A2U2ZwNjc
    qg7RwCB65g5EGCTcFMmr8wbGqdMhLn3DN7iPHE2Jp41F3l6zbBzGAUdPxBTDECuHiOGWCD
    FIkjECli+ieYIiugO+hyyzlmajv8O1zUlS6wsj7q3r32z4LZcM4dEBynzFThhy4Ye2Wshw
    Oe/44eW4hOoZZS3v88xqJ3mZPnim2pObiVKsZ1vVVxacwZ5BZLcuf5TqYUFcif/HXzlLuX
    G3iRDsuycnOjONUPLl1yH1fC38UCdpz7GKj0W5VhI2o2F4NjCs1RqGqvQBRc9UFz7F20I3
    oqyaBWAfbMWUfEUkQv8gDoSmeyvzJcy5Hxi0IcB3W3leAPoNqTcJCZR71wzD4vJV6e/nt9
    njK7mb9K6RsjXedupJTy7q7oSUbYYzDnF0bYIgzITJYrrL7Ozl3JgvU41sXV5EDGWAOfe1
    1nOpxfyzOFd5vXXM65UDOZeMiqiP6r10shCEctMOYsZB0k+Nb4zTB4b3QHW69jQM2moIP+
    aQIv2RtGKtyMZTEQPZTvthoS3QXP0cajRClkqhMmxgZ8kzdXUTFcg1dH9fcwTxbLnz1C1l
    OUrOGtZ639OsaolLw3gzjfwd+Iyj579nwGm3mLvsORkf81w5ipcWepxUd1xg
X-ME-Proxy: <xmx:hQ_Zap8sh_p_vz7_3vvnJY4Q6XsOUr2hlN3FCFTZcTGhW3gwCmNMlg>
    <xmx:hQ_ZajHtI6qmh7nCCrMqH2MLhT34MkAP29LDsD_R-UyW8iYQYMv5wQ>
    <xmx:hQ_ZanPqvvq32uaknhHl2VostLDIyqFrplKxFxDzJnIpe6aJ2dyuJA>
    <xmx:hQ_Zate3A8mAizL-RcS9pVcw4JPz9ZczElA1xrmP-LtAODRUUKXdJg>
    <xmx:hQ_ZalD7BQSXUYu9gpPLqyGCwPnAw8N0e_PaHKLvXjJlrq3DEczfdM8E>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 15:16:21 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm PATCH 3/8] Create helper to get file size
Date: Wed, 21 Oct 2026 21:15:46 +0200
Message-ID: <20261021191551.2975000-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021191551.2975000-1-niklas.soderlund+renesas@ragnatech.se>
References: <20261021191551.2975000-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Before adding specific input file readers for NV12 and NV16 extract a
helper to get the file size as this will be used by the existing reader
based on bits per pixel information and the soon to be added format
specific readers.

While at it move a file size specific check to the helper to prevent
duplicating it later.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 raw2rgbpnm.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 40bb65252efa..33fa7750caa9 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -51,6 +51,26 @@ static int swaprb = 0;
 static int highbits = 0;			/* Bayer RAW10 formats use high bits for data */
 static int brightness = 256;			/* 24.8 fixed point */
 
+static unsigned int get_file_size(FILE *f)
+{
+	long file_size;
+
+	if (fseek(f, 0, SEEK_END))
+		error("fseek");
+
+	file_size = ftell(f);
+	if (file_size == -1)
+		error("ftell");
+
+	if (fseek(f, 0, SEEK_SET))
+		error("fseek");
+
+	if (file_size > UINT_MAX)
+		error("too large file");
+
+	return file_size;
+}
+
 static const struct format_info {
 	__u32 fmt;
 	unsigned int bpp;	/* 0=variable */
@@ -148,18 +168,14 @@ static unsigned char *read_raw_data(FILE *f, unsigned int *width,
 				    unsigned int *height, unsigned int line_length,
 				    const struct format_info *info)
 {
-	/* Get file size */
 	unsigned int padding = 0;
 	unsigned char *b = NULL;
+	unsigned int file_size;
 	unsigned int i;
 	int bpp = info->bpp;
+	int r;
 
-	int r = fseek(f, 0, SEEK_END);
-	if (r!=0) error("fseek");
-	long file_size = ftell(f);
-	if (file_size==-1) error("ftell");
-	r = fseek(f, 0, SEEK_SET);
-	if (r!=0) error("fseek");
+	file_size = get_file_size(f);
 
 	if (!*height && line_length) {
 		if (UINT_MAX / bpp < file_size)
@@ -174,11 +190,9 @@ static unsigned char *read_raw_data(FILE *f, unsigned int *width,
 	if (!line_length || UINT_MAX / line_length < *height ||
 	    line_length < *width * bpp / 8)
 		error("stride %u is bad", line_length);
-	if (file_size > UINT_MAX)
-		error("too large file");
-	if ((unsigned int)file_size < line_length * *height)
+	if (file_size < line_length * *height)
 		error("out of input data");
-	if ((unsigned int)file_size > line_length * *height)
+	if (file_size > line_length * *height)
 		printf("warning: too large image file\n");
 	if (file_size % *height == 0) {
 		padding = file_size / *height - line_length;
-- 
2.55.0

