Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD8D43BDD6
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312311; cv=none; b=EZmyrVwKjBvcniGFsJTc7i0VC45At1NidHWTDxPqkq2Q9h90Bbj/f+re6cnKb0Y/2V34tiXEO4YatgkjZlpaAP2zCrgHhhvbfgHDy0eyLqF38UbThJtLPLfJYULBaZCrJ9mCxgsOsTHKnN8CFioiWzyR3uzNGaJMKGF6mvn8Y/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312311; c=relaxed/simple;
	bh=BOPYSAsb3CqKje/YcY4e0F73RIl8eiebRpNH6lVe0f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvu6eG3xHg8+N9L7XxENF/QIk0mjhOLzWB9J19sBFODEEc0tbbA2JgpG0GueGu690SBxQBNay3AhRtWRdx9rSVT+cgLu7aF6LB6hIbOqkJNFPYsqOy4o0yinG17euCyo1/Vb1d7Akwh03l8xp4Yufb2In6ks7bGv9owU0fmsy6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akPT+8Nw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yrmb3c6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akPT+8Nw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yrmb3c6y"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7ewpm1167747
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6surQOqzNPItlMgudmHbDUDlw8wPb5bA/oEuE6aFfR4=; b=akPT+8NwDrljPyke
	bBxCubc8n6f5XjwVfbJfWJmirxsbXVXdkR/Ctcs5hOyu6UDi3wA7GCmRzASSpTHA
	r2U/Nsl1oTKnHmWx3Sjc0YZ3KifDEIIwsj1RdZlzlWWhvJWWgd6+Onva4UsocvZN
	QTewtBqTVDJIitQpfT1S1m/7p7TzVr0IuJPDnGTLklCSOY3OLIv3CTqtltEIxj68
	YgpdJ7GqiA19eORyx3cpnLNzbtTWm9WE5LQlLDjjf4TvOg5hnoVdlLF2FcTT80xz
	3Vsou26JoMkVc5Y5eDx72Owea5Cj2vyIw2WiaH6vohJsZVolv1efDiKZ50O4viUU
	y2MX+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbhj8jgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:05:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso8259431cf.3
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 01:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312304; x=1785917104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6surQOqzNPItlMgudmHbDUDlw8wPb5bA/oEuE6aFfR4=;
        b=Yrmb3c6yjPOXETZ26kAtObGH36XA/ctCijlzR3p6Og3W5kC87CaBOxN3Jy3T6PSoad
         L4GZiMOL3/QNJklGvg9zmh+OQ3mhlJBtgQKootBfA4kCyqaDiLWdhN7Q1tbJlgRKCkm+
         QMtMIRKUylnsEmEQ1kDRIyP96p/BEWZFMhV1wrRhpjP+qdbqhaoMjuTTp180qAEzSh0O
         nfV09M1HhU2qY5kTKA9WV+4Qr1VUdjz8aOVvN8kh9eLruwgPcCpXyjBIdnhRDCu25/I2
         9oLEeXJn6HbbRsMNKgNjPoN1PpqO3uWSm/nP9knc215ORlpcsUXf53ciBet1QlXtDAm2
         XK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312304; x=1785917104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6surQOqzNPItlMgudmHbDUDlw8wPb5bA/oEuE6aFfR4=;
        b=YNGFEOwKkoxrfxemu/TYF6rdc7nqZg5Flk7AiS1FmuGI67T47fSXB9Di/0Wc1h96eH
         cnUB2fEUPhirf4E4fa0KftaRj8uR/OAVbKGrvDbyozN/AXba2O8p36uoSGbloio2r5I3
         ZBUziDoPVMOnpxLvHFHiFOXGWAEWL6zqsTN5T1SXtBrMeZ+gju1CRZRmIS9EQeDnmKdU
         JCxOl3LYN6khPI8W4evVNHHsMsOObsym0qq+T/IAhYbz3TQlIV/vsJ0ruSqOTqupyJwY
         31VNgj/WaFl6Ypqjjd4IcN9UAFn1ktD9O5nR8Cg8UkuuXDVn7IanHy6UixedQ5hBUGXM
         heLQ==
X-Gm-Message-State: AOJu0YxHmVu8qQtWNK24WmzPyXxBebgvZBgeokfnUIWFiP3H+5kzoO/Z
	m8MWXA0VceCLnhPNEJSXaHv4wkQlfMstzsc4zWRVFZQIUDhovJIHqccY4t4KR9l6QeyNdIlYGxt
	jGy1MlnMpNbgSkz4u8DquahqlUG8ZAXNRDmqBkLvY5FDaDXsjm0l2sAtvQKBLtsV63Q==
X-Gm-Gg: AR+sD13ZWfaTg06XmSAaLmZ0vEQDhnC0D5bD7pax7e1oqICyJF9zjI1S8nCc5bcYcjx
	ehXY4WWQu+etDD+HB6ZaYpH+uR+lD6eyFQrZLiHhLXoF5yJWjZFh3eHRkJdXDCOa+hOLPi8yas9
	KdWMLg/PlM5fRwyjwHf6YMaPYyznAMwsd/rUg8cNUx/RAo2NnuE8pLwzLKNBJHdqLg0Qf+5Z9C7
	zqeLPBtlzVmwOSBcWLkNcPKASG3bwEj9RsaUawv31udHikmCFXGYjV2sLlTFfB1ooZ8NOmbOPpL
	6eBQb1+nKuJcmNXeQ6odGn78LY+/+wlpAanKRef8SvguEd+X682Ju2tMk4CPZ18oOtO5HxRiU52
	jkEwGc98jL130ox4AYXFiC3xBI+rWEHHQwE0zEormD8kASW7Vb5U6Eqx2qG5yhNLzVlew
X-Received: by 2002:a05:622a:1a99:b0:51c:1408:6c12 with SMTP id d75a77b69052e-529d70d6b93mr50413431cf.47.1785312303479;
        Wed, 29 Jul 2026 01:05:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1a99:b0:51c:1408:6c12 with SMTP id d75a77b69052e-529d70d6b93mr50413131cf.47.1785312302954;
        Wed, 29 Jul 2026 01:05:02 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e30f2a96sm13772631cf.28.2026.07.29.01.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:05:02 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:04:32 +0800
Subject: [PATCH v4 3/4] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-og0va1b-v4-3-ec7e7ed87b2b@oss.qualcomm.com>
References: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
In-Reply-To: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785312282; l=10063;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=BOPYSAsb3CqKje/YcY4e0F73RIl8eiebRpNH6lVe0f0=;
 b=4qep5gu4I0EMf/eU77r3hmgjl120Wh2+hXkE4a3Aj/EyZEXOZgHrG6MCbJsMScHXNZUW2QIjg
 ydy6pldl3qvBIU9Dy5StMY2AJ3ee30ijG8JFC2A4DYbOICEb4hnuGFS
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfXy6dQkNjARHln
 CsFq1lkol6P+agL6udj1TrN6nR3ahtc0umhCXWUv0aIUb7GhlNmgDvkN8NMY9ZJrXzkegsVpF67
 1oQFdzWJjRIv/g3NF9uJX+GxRZ8WcISOTOZbt26wByh1UpFekniXw9NE3BpvWOjHEDxht8vihkW
 zySA1Qg6h7EJwEWa4TTG2/E6wLXTS7BxNYe/cA7TZFHv7Qnvt6/Q2Gx0V31IXhFpEh+1Mw8nG5M
 6LUqnZX79QOAlDHVQ8R11oU63HzNH1A4CgrEEVZL3jkM6KSz6tNTb5fMkz/W+glUKeYCFUcGYjV
 L5Ql35WCMSYRFn1kXiEX39wa37jl9nokTDlPbS4obhaX53J6YxzjzD6Bo3Wi4f53kCFNrZNpP5r
 ap9eKjY2wfe7Iw1heuib59C9GLGmehlagFwdxvOH+m84PjiNxA9OYMameifgoxRwHh1srF3pnXj
 eU9fwAbS9I6fGd6DORQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX9eT9hb3qDr2L
 uIMa88XoIvIeQ7uBbx8paujvYKZGruYZS+juuzMgRRcxhuBY54ZApMC2Tf6EtBFeDLNOPUy11pH
 83soH+fKIMRdi3B0SBEp5G7DBeWE88w=
X-Proofpoint-ORIG-GUID: iaAb8B36uR9GKeHr5JFeU-iAfOFm9yMu
X-Proofpoint-GUID: iaAb8B36uR9GKeHr5JFeU-iAfOFm9yMu
X-Authority-Analysis: v=2.4 cv=dsvrzVg4 c=1 sm=1 tr=0 ts=6a69b430 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VAKwkO4vsx98L2EZLfkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290064

Refactor the driver to separate sensor-specific data from the common
driver code. Introduce a sensor_data structure, populated through
i2c_get_match_data(), to hold the chip ID, MCLK frequency, link
frequencies and supported modes.

Test pattern programming is described by a per-sensor callback, and each
mode stores its media bus format code (rather than a bits-per-pixel
value) so that sensors with a different output format can be supported.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 99 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 71 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index da5c8e49d4a811f55736bd89c6922856f2e7391c..df428137cfdc1a0936c9bc936d015ed2a649c218 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -65,11 +65,23 @@ struct og0ve1b_mode {
 	u32 height;	/* Frame height in pixels */
 	u32 hts;	/* Horizontal timing size */
 	u32 vts;	/* Default vertical timing size */
-	u32 bpp;	/* Bits per pixel */
+	u32 code;	/* MEDIA_BUS_FMT code */
 
 	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
 };
 
+struct og0ve1b;
+
+struct og0ve1b_sensor_data {
+	u64 chip_id;
+	unsigned long mclk_freq;
+	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
+	const s64 *link_freq_menu;
+	int num_link_freqs;
+	const struct og0ve1b_mode *modes;
+	int num_modes;
+};
+
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
 	"Standard Test Bar",
@@ -99,6 +111,8 @@ struct og0ve1b {
 
 	/* Saved register value */
 	u64 pre_isp;
+
+	const struct og0ve1b_sensor_data *data;
 };
 
 static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
@@ -247,13 +261,13 @@ static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
 	{ CCI_REG8(0x3f47), 0x35 },
 };
 
-static const struct og0ve1b_mode supported_modes[] = {
+static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
 		.hts = 792,
 		.vts = 568,
-		.bpp = 8,
+		.code = MEDIA_BUS_FMT_Y8_1X8,
 		.reg_list = {
 			.regs = og0ve1b_640x480_120fps_mode,
 			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
@@ -273,11 +287,21 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
 }
 
+static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.chip_id = OG0VE1B_CHIP_ID,
+	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
+	.enable_test_pattern = og0ve1b_enable_test_pattern,
+	.link_freq_menu = og0ve1b_link_freq_menu,
+	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
+	.modes = og0ve1b_supported_modes,
+	.num_modes = ARRAY_SIZE(og0ve1b_supported_modes),
+};
+
 static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
 					       ctrl_handler);
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
 	s64 exposure_max;
 	int ret;
 
@@ -314,7 +338,7 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 				ctrl->val + mode->height, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = og0ve1b_enable_test_pattern(og0ve1b, ctrl->val);
+		ret = og0ve1b->data->enable_test_pattern(og0ve1b, ctrl->val);
 		break;
 	default:
 		ret = -EINVAL;
@@ -330,10 +354,19 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
 	.s_ctrl = og0ve1b_set_ctrl,
 };
 
+static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
+{
+	const struct og0ve1b_mode *mode = &data->modes[0];
+	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
+
+	return data->link_freq_menu[0] / bpp;
+}
+
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
+	const struct og0ve1b_sensor_data *data = og0ve1b->data;
 	s64 exposure_max, pixel_rate, h_blank, v_blank;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
@@ -343,12 +376,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 
 	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				      V4L2_CID_LINK_FREQ,
-				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
-				      0, og0ve1b_link_freq_menu);
+				      data->num_link_freqs - 1,
+				      0, data->link_freq_menu);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
+	pixel_rate = og0ve1b_pixel_rate(data);
 	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  0, pixel_rate, 1, pixel_rate);
 
@@ -407,7 +440,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
 				      struct v4l2_mbus_framefmt *fmt)
 {
-	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
+	fmt->code = mode->code;
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 	fmt->field = V4L2_FIELD_NONE;
@@ -421,8 +454,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state, u32 pad,
 				  u64 streams_mask)
 {
-	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
 	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_reg_list *reg_list = &og0ve1b->data->modes[0].reg_list;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(og0ve1b->dev);
@@ -484,13 +517,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *fmt)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct og0ve1b_mode *mode;
 
 	format = v4l2_subdev_state_get_format(state, 0);
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
+	mode = v4l2_find_nearest_size(og0ve1b->data->modes,
+				      og0ve1b->data->num_modes,
 				      width, height,
 				      fmt->format.width,
 				      fmt->format.height);
@@ -505,10 +539,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_Y8_1X8;
+	code->code = og0ve1b->data->modes[0].code;
 
 	return 0;
 }
@@ -517,15 +553,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_sensor_data *data = og0ve1b->data;
+
+	if (fse->index >= data->num_modes)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
+	if (fse->code != data->modes[fse->index].code)
 		return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
+	fse->min_width = data->modes[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
+	fse->min_height = data->modes[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -534,13 +573,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 static int og0ve1b_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	const struct og0ve1b_mode *mode = &to_og0ve1b(sd)->data->modes[0];
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = 0,
 		.format = {
-			.code = MEDIA_BUS_FMT_Y8_1X8,
-			.width = supported_modes[0].width,
-			.height = supported_modes[0].height,
+			.code = mode->code,
+			.width = mode->width,
+			.height = mode->height,
 		},
 	};
 
@@ -586,9 +626,9 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 		return ret;
 	}
 
-	if (val != OG0VE1B_CHIP_ID) {
-		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
-			OG0VE1B_CHIP_ID, val);
+	if (val != og0ve1b->data->chip_id) {
+		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
+			og0ve1b->data->chip_id, val);
 		return -ENODEV;
 	}
 
@@ -624,8 +664,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
 	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
 				       bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       og0ve1b_link_freq_menu,
-				       ARRAY_SIZE(og0ve1b_link_freq_menu),
+				       og0ve1b->data->link_freq_menu,
+				       og0ve1b->data->num_link_freqs,
 				       &freq_bitmap);
 
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -686,6 +726,9 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	og0ve1b->dev = &client->dev;
+	og0ve1b->data = i2c_get_match_data(client);
+	if (!og0ve1b->data)
+		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
 
@@ -700,7 +743,7 @@ static int og0ve1b_probe(struct i2c_client *client)
 				     "failed to get XVCLK clock\n");
 
 	freq = clk_get_rate(og0ve1b->xvclk);
-	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
+	if (freq && freq != og0ve1b->data->mclk_freq)
 		return dev_err_probe(og0ve1b->dev, -EINVAL,
 				     "XVCLK clock frequency %lu is not supported\n",
 				     freq);
@@ -819,7 +862,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 };
 
 static const struct of_device_id og0ve1b_of_match[] = {
-	{ .compatible = "ovti,og0ve1b" },
+	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, og0ve1b_of_match);

-- 
2.34.1

