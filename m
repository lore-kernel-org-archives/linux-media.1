Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912424;
	b=vHXT/f62FJLhC6sHQSYbGgcjUrzO7aq2n5hqNmpCwq8t0U4grqnUFnBVVmmFp0HN1SFI
	 AhNt6qj+1CueFVNSD11sBy8yHUSHjQgHdgULczbJpA15hZHdjcymZYGWf19bo1zJJakaS
	 GsS0ObAWycplfHZCAsyWAv+TMbQpIFNvgiRBzUGH646VNIdHUp9sUQg98fr/aYPDBuCxM
	 nbcXqkLAeatsyj89v/KBYCnXAfmvtykdE/jHxQMk1iJmMDDuZ7+ltuFbDRCMIhXKzktU8
	 APl9Trfrw++uALwi66nI2pKN44NESCbtvzyRPJWnEOvz2u0UzJ0PPBFArzH3b5s781A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=;
	b=SqikXRYzaTC1U3agER5qaZjpcJt4BooOxs5UKej8LkBlgaEnlWvqwd8kNof7cZNPDLJK
	 kGY5DZOy33eZWI47+EvnBHdqqbpdUtDOI9GsA4PlpPuvPlqeVO3F4KnkKEL3p6rHLaKrx
	 2d0WM6172RMK7PMRvygtpkzfSK1pypJlcu0O7Tyd6QJGc63Ync+sJQNaVFPU5FcAkinz3
	 WJiIcLSsLdR1mO1e93NW2FaacOkOo3QirUxyUKcEDRUEom0ycY+gGB/TccRr9+qR3CPDa
	 GzqQuTfOAhanBJIZ4+83v9o3kB7S1rYh9DrL0OrfArLoFos9R9GJgfm7nXBFFQhVw1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG7faaCp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JAUwo6gP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414FA606A33A
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 414FA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BG7faaCp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JAUwo6gP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8wM0i2935699
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=; b=BG7faaCpNM49oeVZ
	98k+QTU6JqdwQDU/yQ9DzR/9PmK3ci/tDVOtfKExdnjJ9Lweqcf3bjXI5lyFQ6Rn
	h2tOe2VXIdJ8mkaLLNmwvU5QA3dM624m4V8w8mc+eXKEpUMW8SonPCfftic+1V4U
	eiWpGi7CJzPozK0jFNQMbrt0Z4mgfUV3ElTsy8aHiyRit2t5ZsK2pGRfqopnOsgQ
	Q+sBa5siuP6ZlrlR2ZzWoC5Vkzz0DoeP2oCrBXOjiITPCIfB1K/vrjheUbkGkjfh
	YkAkxMeaZrugoTj8cIrpupd1uJJ8u9CPiWqOvN/7CShW3Y/QgUigpTyyWQDln3iE
	CN/AfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0appe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:47:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so492115585a.2
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 02:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912422; x=1795517222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=;
        b=JAUwo6gP25hRSI8Oy4GhKhX6JfOi7IRgA9Dj28wlW6qQSNn7XhqdxdLV9op7JvY2cW
         XbpaFlQthQr10Rh+d4ZaPTKFwY0Qoq/PSVRhaVckkqxNiVG1zaUQdxMJffqVk9FALWF7
         jr2t8170TvMH1+pnyBOFkrbELeSFpxpunniXTJRfZ41jXmbSGtKBBDkY/2jshE4uJX+Q
         V5NAeJOdyLToAh9jDQBllzpNCD8ARt878B2dXReAat6d5Hwo04X58m5ItDmfwTNprP+c
         0q/gyZ+9oLlSZ3RRMwwf0pjjmvmlIaZsgIEAMsd4MSQVDyWoWOSxE0Zop55kw+dzs+Tv
         GoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912422; x=1795517222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7AzRK9KzJUJTomE2MyJghN0nH1RobHygXHPHQ+1KK0=;
        b=eebOn0aiGUnat9uA/N4BA8RalzTZU7ltwD+Ru8Qz6YCgLDmSARj/hog3l6hBYnMk5c
         AQhOEWQiVru+ARkkykcCqWSkn56ro9lN9oxpP8gxzBuz+nf4eOYU7foHL7kkXzwxMv1L
         oBdZMMGdOMI2tDAAXY2mLmWKiJ9veTJtCu21W0IGAB2qCAUljMuzZTBn5pAHYUsZnSlw
         AfXSERzAFbQQStVDTm1mSiHgTwLyn2WuPSf1rBtPdXFHxGSO/7l+/A+DbPHgZDUwG2TH
         +czSOdyTUQ/7F+2KCC1FAzjoqx+g3Z5/mRLsCnegsd2y8/UfQiEjFwtvKRdKENbd1Pjo
         epwA==
X-Forwarded-Encrypted: i=1; AL+hErFoH39ndr3DIElWGuEbfe63wxQp0cTHNrKSTtTxf67yGsIFNxubl5tu0HMJebpHE5vCPLuUau+PwWO/Bw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ed60+oNTG1MCZwbIVqknHD/psUoJniHtnu+KDYIfEfybhBFU0
	oUvmSmTC2KMoq/RLtay5kwAip9SVwW4crCdrSqz56RQj5MXTDp6G6OBG9ZeRYmraCpvE6vtNP+B
	Z4oWRvaI5Lz16Qf09kajUTlPX3pzWnQQcXpDbVHyJ3NYZr16bydAiIjb2r5Xzx3z5Xg==
X-Gm-Gg: AYBFou1xoH1vQcZywDMmk9NcD4oGZtgGfaFOaxcmGO8Gg5scmUGqHEk5aO9Pkpz/AE1
	AMPF+pf7wqFxAT8ATYttIdb9cX9MrVWFWw99oJRKiYPXofzaD3w88y9uMXTQBUaZJwBc2tb47Iv
	iebq9qLRQk0/eWT5a23m4YaUHEuAbOibT1+uHLwJQMK5qZC553rp41ETNksJIBCAXOM4H7nIhLc
	WY5hdNSAG3YGW5hZ+joFiuMMoWyOs/82nqRgp45rCD0ZWTci1sZj3DA+x1JfgKxCXsfoQ/lsVCk
	BZF/qbolGkA2G/yncwTLUmKwnF7AOKNedD2M6BZGoyjEUI1ekfcQQBG07CgD1ndAg+o/3MVg5AO
	/fT6cvrBVyfnC+aahtwE+Hp/3zbuPzfZa3ehMsbbBj2PDu6/lA4clChGa4vlAS5lDxWqAonE0da
	vDjrqSSLzNpGvjgjxXUw49J10ZBE6jnPiId5/kaflwElwLrgg4FiPSKenDxl08VC+vZ3bi1BtvB
	sCAQpcuu0pIsjSb+NQ3RiAUYEQ=
X-Received: by 2002:a05:620a:44ca:b0:949:730b:53e9 with SMTP id af79cd13be357-949730b61c5mr1289417085a.31.1794912422457;
        Tue, 17 Nov 2026 02:47:02 -0800 (PST)
X-Received: by 2002:a05:620a:44ca:b0:949:730b:53e9 with SMTP id af79cd13be357-949730b61c5mr1289413485a.31.1794912421916;
        Tue, 17 Nov 2026 02:47:01 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm119178335e9.5.2026.11.17.02.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:47:01 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:46:53 +0100
Subject: [PATCH v2 1/3] media: qcom: iris: venc: keep the crop rectangle in
 visible resolution space
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-iris-fixes-v2-1-0b21201ab137@oss.qualcomm.com>
References: <20261117-iris-fixes-v2-0-0b21201ab137@oss.qualcomm.com>
In-Reply-To: <20261117-iris-fixes-v2-0-0b21201ab137@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfXzw4lhj2p0Ag4
 v9EKcfaPsyZ/4RxWf+5vUAt+Uc6f3z/mDHIMhUzItHCBQRnKpx+uiCvoV0BZrjN0qDQV17Osk4X
 2EN6Ikq99MgHw2rRMJONrnIwWPuZnlo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfXy0e97g8tMknV
 ksccvigW0i+jZGbYNf7S6bjVprogj9qDDiqE95XrwHv5FgLXZHlvM4G0LQrQkpVjqbC5cqm4mmO
 UZZmzaVgkEWOWVmYC6ZAyncnz0m43To1jPaNBRITCy8JoXA0Tz194JQteGNneGWGFtzQI6NJPy8
 ncKJvPydLgIAd7fJIMZUCYQBGPg7M2uZu0+CNeZmwuT3ds/nt7PmC1dT9CVa1stb5qqT8SMFa4A
 5DnvLzXN9kviIDjXljkztP2nhk8pB9qI7BUFPYDuZ+dPFT5oK9PVmb9XEECpNMtn+UyH4OgjizF
 QOarEx314gi6GnJRAsm8IQOsm+E6WhgQaxiaywz9E7j14BSCmzDAiY105QDjbnk7eYzdY7n4iGo
 Rlfa2ibBfP4Oqz+D0dzzjjRaPXbTyUZY6CdhWbIBAmjO42atBov2LNBJ0J3w6m9d9QQ9HZ48kJ2
 UptLh+FqsvmzqoaBqtg==
X-Proofpoint-GUID: M0zn1XAZfqhvLrDPIO98qFnS5WmiY0gx
X-Proofpoint-ORIG-GUID: M0zn1XAZfqhvLrDPIO98qFnS5WmiY0gx
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc30a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WErB8th0LOlg1rsA1XYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170042

The encoder keeps two source resolutions. inst->fmt_src holds the padded
buffer geometry handed to userspace, with width aligned to 128 and height
to 32. enc_raw_width and enc_raw_height hold the visible resolution sent
to the firmware as HFI_PROP_RAW_RESOLUTION.

inst->crop must use the visible resolution, because
iris_hfi_gen2_set_crop_offsets() computes

	bottom_offset = inst->enc_raw_height - inst->crop.height;

iris_venc_s_fmt_input() seeded inst->crop from the padded fmt_src instead,
so any height that is not a multiple of 32 underflows. Both offsets share
one payload word, so the right offset is corrupted too.

Seed inst->crop from the requested visible size, and report CROP_BOUNDS
and CROP_DEFAULT from enc_raw_*, so the bounds match the real source frame.

G_FMT is left as is. For contiguous NV12 pix_mp.height is the only way to
report the vertical luma padding, and the hardware is programmed with
scanline_y = ALIGN(h, 32).

  v4l2-ctl -d /dev/video1 \
      --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 \
      --get-selection-output=target=crop

Before:

  Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 736

After:

  Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 720

Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vidc.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 2f2c56bf9122c73e10e86815b1aa5fad99b0fb42..c55d2d905c0064c6d292158ac741571a1471dc82 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -312,8 +312,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	    f->fmt.pix_mp.height != inst->crop.height) {
 		inst->crop.top = 0;
 		inst->crop.left = 0;
-		inst->crop.width = fmt->fmt.pix_mp.width;
-		inst->crop.height = fmt->fmt.pix_mp.height;
+		inst->crop.width = f->fmt.pix_mp.width;
+		inst->crop.height = f->fmt.pix_mp.height;
 
 		iris_venc_s_fmt_output(inst, output_fmt);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d5c3788f5dfe5857f2d6b782e7a83..e3eaec1b7c2e30c065d8419ac3278756f70a8a97 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -522,8 +522,8 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 		switch (s->target) {
 		case V4L2_SEL_TGT_CROP_BOUNDS:
 		case V4L2_SEL_TGT_CROP_DEFAULT:
-			s->r.width = inst->fmt_src->fmt.pix_mp.width;
-			s->r.height = inst->fmt_src->fmt.pix_mp.height;
+			s->r.width = inst->enc_raw_width;
+			s->r.height = inst->enc_raw_height;
 			break;
 		case V4L2_SEL_TGT_CROP:
 			s->r.width = inst->crop.width;

-- 
2.34.1

