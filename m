Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912425;
	b=fD1FjByHNgyYIOHc2do/X/aviegPPBPG/XG4l+Sh7HZOPaICTzqfWqhGjU3mkzt5eOVZ
	 x4HVKTrQMpDU0yCvTGZrfRX8olWkA9lsiRHxbclmrbbm2mgAom0dW0G9bug3zAfnOu2vD
	 ETDxwCnA6XjgLhgPRJ4/reic/ODSNz9brjGn+smxPRjRdyBlF0d1THUqIM4l6bz3mv/sO
	 zVdJIMUox5KCY7vwh0csOGeOPw1+tK9T/jD701PE6fT1NjcIPVSADoxkLidjnm+oTV2um
	 LX7FsSTwH6knCNRG73KwqGO1fG2s1uspJqjVe0AT0L9Af9Tye8mrBJVk57iHZ+zOVGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912425;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FQUQ/jOJq8X0ZQRpWWjLXu7soSdrNQcMZ36bXI8ovyw=;
	b=r9rsWnF8vLdr4b28JSrKsIzX4gKQB2gsaP390+uxfm+hgh4HW26hZx2WRcRxfF2z3fmK
	 mPSIFZju9nyHtxgCraC3rO0VqbKJ0TBcRkENC1weO6RTiFDZvomLqmktlWEQj4lnf9D8n
	 btURn45ER1C2zawKYYxUL8/U41A+uIjzB+cDRBH6twjPpBks9a0wJ/Gd2MYV0pSacxm1e
	 ZT1RkZjO2HHN1uYj5Qk/T8ZRhxUn8OQqz4QqlLQlI3lVNOCDCcvSsgVGXr35ARvD72CAo
	 LKfMrnshTcgTpVcCOtbe/CeckDq25+sPLK+Ff0pxNNr2u3w0yuW4//PMEiwtjOG7iCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+ROPzlc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VEuUlNbJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D63C606A88C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D63C606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+ROPzlc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VEuUlNbJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8i4xj2935297
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQUQ/jOJq8X0ZQRpWWjLXu7soSdrNQcMZ36bXI8ovyw=; b=O+ROPzlcOMj2mgr3
	1VsDNsZlAT6WiXJTYMdgnyuzxuTUUbMwjb81PmZ2UjhDRqUhw+6GLvLKbBZcIxp5
	YLjMJrE4GI7wseLDWWUt7mAnHZa/VwVkr3zj8zQHc9Unyb3grf2rGN25qm+9Ws3j
	amznl0owijfOd/Q+N4FM1zCc7K7ohLMwfZp1j2hjo1g/0J2y9Am8VSUuSktp1vsc
	wCSmlDpmsDoR/g+uwy+aM6HDbyUV3ghU8OVNXcJJsEqfkiafxN5PXBc/zqUuwmGz
	btQH584uOo4Lpnwtf5ISdRfL48JXVqLptZXswHXukW6PHCvJfTAB/1OEM+rKrF8e
	xDNDAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0appm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 10:47:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so1343773385a.3
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 02:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912424; x=1795517224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQUQ/jOJq8X0ZQRpWWjLXu7soSdrNQcMZ36bXI8ovyw=;
        b=VEuUlNbJoWmCbqaHAinowMUl34/DVih/siaS3O4iHA2bb5HmCgkcBH/SHqMWZF3jeG
         7zUKeFnHmStPVaDgczJLNHAWzxtLpyPFA6s4kceK+LYL1e2YW2TnL+jFHx0WK1VLsdSe
         ftr4EBvDFbbyjV8OsLqJsng9frrL0pSu6nGEs6nxo3dba439qlqOmb13nvOR/wL75t/l
         WZfA4z86fyieqEESKR5nwFOfNkjkIoBnIW2fryd6nwG4A3yGgOydWGRBdykSW9Q8CqOq
         2ZVuzujiOW4aViKVITiVJXsSlVownYl3zKUa+UR2Bu6t9dZ81fvqQKMfRTaivbVfkR0U
         kytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912424; x=1795517224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQUQ/jOJq8X0ZQRpWWjLXu7soSdrNQcMZ36bXI8ovyw=;
        b=adgoXqoAgOtcY046Lf2uXrSD6h9ZOGtT6HsekIz6lawYgzolCwhfQxff9ClNKVJPqz
         n3CYM2F6JeVfnZLAFtb6TCUMPXkdpDGCMlGgAl05loNQekVylqdbtKqUkLasVbMbLltW
         t1d31Bbd4/LsWYAR6r2KjLcFTfimzlOLbxWmyE8BEHewjAaFi8DlvSBad3U1VfKF9iRL
         UlVMqm6ZSZxqkwuLOlVJ0vP+9s9S3nEMeIwBM4VoKyIbDao25bb8VTCWmk3no1s2z7kH
         lP5RvXG14uPRgbtsgrkeFD+Kay3lIJNt7UrX7Fk56p/0jf/H91lR2hBf+CzCAeeAwIaX
         COyQ==
X-Forwarded-Encrypted: i=1; AL+hErFKub/blf8hc4KvjAacLe+n5gkqZI0i1i9aMcRiXlrIXk597LAOxMY74YvRXBgYuL17FHArwj9qpuGqfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9L4EQe9aMZuqCmngc4CfaeMqCFefDtmFD1cazl+H3X0LEzHrf2
	Wyv5IYCWl+gZLnbh3y4veKA/V2js1vdaIgToMiRn0ogH1LSw+EPetnPC0Q5hJGUEQu6KdE5C/MC
	9pgdesx5NUmlCF95NRSx03IjrFHzt483ES6Hj6KqrUFGTWtLCU1LYZbPSebnvlJmykg==
X-Gm-Gg: AYBFou3LKUqo7fg1GllvTCLXzYSnq1OYHgRHMRO0LISb2HA6VnBrhC0HrCGg9Bsv9H7
	LrTMyUXEeqgdBiMpxgnP8ZYfgLXrNPQ+DmZfyfDOYZsDDoSp3Sj0u/8eKrkzHhHFjfiUwgm50sk
	b91lKx4LqNh0wIlr2ThS+SfYxv0gewGqka98Zj04PhhOKoo7kDlHMHGOObLqPVM2ERPuM/ybwk8
	Ruu1GEo0stC9nZyidLey2fLJQe3IPprbV1TSXndPehopiyjkJzXDvDZdHyXSTvXY8dVmFm6On+Y
	mCUHuWhzIU5d8xv3ggA60FNpVlmgqkIick8Fzy5OenKnlOVvmnZXBQ1tAgBp7S737oJ2djui6Z4
	EajLwI/Hjzi5PlFr5GNHO9Pm9OOVvWL6N3ilPdWx9lw+B1yLoebaDm7Bwxw+yYP/hEFOImnhAci
	4QVQDLCveflWBmI2acPAMzD6ins/Lpz13eoz0KBWSGmHXeZXx9iRUXIYQefbIjpHLERuzYqu1sA
	piEGsW1A22N08fCG6tHv2Y2O0w=
X-Received: by 2002:a05:620a:25c6:b0:93e:bdeb:f067 with SMTP id af79cd13be357-9494bc0cdcbmr2164050485a.48.1794912423855;
        Tue, 17 Nov 2026 02:47:03 -0800 (PST)
X-Received: by 2002:a05:620a:25c6:b0:93e:bdeb:f067 with SMTP id af79cd13be357-9494bc0cdcbmr2164048385a.48.1794912423355;
        Tue, 17 Nov 2026 02:47:03 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm119178335e9.5.2026.11.17.02.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:47:02 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:46:54 +0100
Subject: [PATCH v2 2/3] media: qcom: iris: venc: detect scaling against the
 visible resolution
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
Message-Id: <20261117-iris-fixes-v2-2-0b21201ab137@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfX3hfjsHQM/eWS
 WsobElDS/Q99f1AjZl8CnF1CBpFteQgz0qwQRJliOWIUdDSu3qWJUqk/2C6AMXTRvUrnjgA6+0w
 ARNKE+/23k+hTjihttzQtEdDnBAZlFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MiBTYWx0ZWRfXxA87KQ6dBAVb
 yKYMZwcVNZyoCW/IUtFYAb6hgmpZ/oV/eVY/s7UihcY+m7/GFTXH8U7jhHXWOKW7XRrdUAYQSfg
 EB4MMBxqpQJVrk7Zl2l3zDWADwkCdEJYINVe5BA9z3OVtTZ9+UfjC7bykTM7OAseB3gRMl/DMFM
 HuOpo2nVWSGCS8+MubKENHpk/PmAtc4pKEQ4y5DouaDI2jX8ZmDPhRcNVUDEZ18k7YkQWmY74Nr
 Uu1/yXdBa5osm87QXhZ+cF5wkGIFQOWls28BcVszwVI8MIurtm80IB9qBM98u3t/W/bYKCR306L
 79say5PMUAoJnkGJTR39lfYRMvNFeNrFHpgX3yrzfupOSv69HkblenQuXVb91hIutH7V5VqAzZS
 or8wvRaBTDnAIsni8IO5odjPD99/zlTp+y6k4jCBJhImYbXd6U48DPPhhHRoVoM5JIkjb1lFW3U
 VvachL8VeB1dDoW8BlQ==
X-Proofpoint-GUID: _QgXWyXQ7bgGBKWW_ynNiKrrgfn8m-q-
X-Proofpoint-ORIG-GUID: _QgXWyXQ7bgGBKWW_ynNiKrrgfn8m-q-
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc30a8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WErB8th0LOlg1rsA1XYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170042

iris_venc_s_fmt_output() decides whether the session scales by comparing
the requested coded size against inst->fmt_src, the padded buffer
geometry, while enc_scale_* is relative to the visible resolution in
enc_raw_*. A 1280x720 session that sets the same 1280x720 on the CAPTURE
queue is therefore taken for a 736 -> 720 downscale.

Compare against enc_raw_* instead. iris_venc_s_fmt_input() has to seed
fmt_dst from the visible size too, otherwise the internal S_FMT it issues
on the CAPTURE queue hits the same mismatch. The encoder does not use
fmt_dst for stride programming.

Seeding fmt_dst from the visible size also means the codec alignment has
to be applied on every path and not only when scaling, so that the
CAPTURE queue keeps reporting the coded size. For 1920x1080 that is 1088,
and the firmware signals the visible 1080 with SPS frame cropping.

Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_venc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index c55d2d905c0064c6d292158ac741571a1471dc82..b367367ac2ccf874a00606b8b1352fed37b37a57 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -240,14 +240,18 @@ static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 	 * If output format size != input format size,
 	 * it is considered a scaling case,
 	 * and the scaled size needs to be saved.
+	 * Compare against the visible source resolution.
 	 */
-	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
-	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
+	if (f->fmt.pix_mp.width != inst->enc_raw_width ||
+	    f->fmt.pix_mp.height != inst->enc_raw_height) {
 		inst->enc_scale_width = f->fmt.pix_mp.width;
 		inst->enc_scale_height = f->fmt.pix_mp.height;
-		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
-		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
 	}
+
+	/* The CAPTURE queue reports the coded size, in whole macroblocks. */
+	fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
+	fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
+
 	fmt->fmt.pix_mp.num_planes = 1;
 	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
 	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
@@ -293,8 +297,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
 	output_fmt = inst->fmt_dst;
-	output_fmt->fmt.pix_mp.width = fmt->fmt.pix_mp.width;
-	output_fmt->fmt.pix_mp.height = fmt->fmt.pix_mp.height;
+	output_fmt->fmt.pix_mp.width = f->fmt.pix_mp.width;
+	output_fmt->fmt.pix_mp.height = f->fmt.pix_mp.height;
 	output_fmt->fmt.pix_mp.colorspace = fmt->fmt.pix_mp.colorspace;
 	output_fmt->fmt.pix_mp.xfer_func = fmt->fmt.pix_mp.xfer_func;
 	output_fmt->fmt.pix_mp.ycbcr_enc = fmt->fmt.pix_mp.ycbcr_enc;

-- 
2.34.1

