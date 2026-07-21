Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EB43B7B8B
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600477; cv=none; b=OpbLGjY2bPZGudnqK17N6hnctUn2HAi0FWa3lbqk1Rs3bn10np+2NTE1WLk50MDFPgVGMZFTOU4c3CnBPhHuj5T4hZccesDn899ZzP63VRos+NbkvNpq8En0yRlqXpo4wKF2zZF5RROdkUZL6az1RUJAD1NdQ7U4l1EZw1WJsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600477; c=relaxed/simple;
	bh=P6TnMsUuMSA78Yjeo8YpqUe73vaQ56ywFSdARkxIgIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PjH0QUtMyA/TIJ3IAWh0yHyl2HGIh/4pZfxGsUfG9Xf54D/nER4Xf0I9KCsGP1B3N9aUVPu7k2V3aQPtdf5wk6kG6UfDPeYn8aSXJc9hwEUHO9iznJTDm6kAbYUtxNRuFdWqBmaJ2wtOLhUDA4MIynU2+lGP1PuPPgsFB5TJ6xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+i8JMQH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YN1Yknj8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+i8JMQH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YN1Yknj8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCwjG3978850
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEfLpQZc0kvFMdKyhBfCbhreCCYuh8w3Y6+3at+mpRU=; b=C+i8JMQHmD638deU
	OCVz1Y13dkNHHgv1RszzyMVPKz69UDY/cQ1lYKDyHoDZD+TkSQEB6OtpdC4O5Olg
	eBB+VolIhRp1nYYE6FKowlGBExpZm6MIsOq7UFjHc9A+JIKr3i7fOhQ78YSmwxws
	xlDYTISu32MZ2SeBlBELeUNgM7jpQJsREAK+a1UHj6+QksTAmHIil14Lf4xuVt1Z
	9kjP5oPvFqhpcWgNOK9C1mCLScp9uBLpALhhjmR3E93V1feTFHKLvgq054v+Mrb6
	XVexCLCZlVtTyVyZsUo89CKi0Ig2AIDUE29fHAiupE7k2O/G6Pu6N4kvCBPEY81B
	zlzBYg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv41vg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:21:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso7403679b3a.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 19:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784600473; x=1785205273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEfLpQZc0kvFMdKyhBfCbhreCCYuh8w3Y6+3at+mpRU=;
        b=YN1Yknj8XL2mdPbDVNwhhzQ/jyuV0+GbCIP5wbaq9VYSxMhb+UrrO6uu5FL+qsCzCH
         OvAeJKM6rg+thZYGxN+apKnDoDErEMmQfTZvcbdYM5pezdTuaIgpz2W344uP2ZUMB83r
         Zcz+a8rS0ieKj1cs//QJkugMaNJdYKj9d0TfnXvoWVZ4/Km/S4i3Cpki2Yk/XXDjRigQ
         IALCaD64zMg8o0JUMhk9g1ebgkTBKBxOQCfItsio6MM/sYV0+sbGE3Vcse5L/cMgzrgS
         hH4heLhI535hpd/TMJTiss6YWaR0cy7KJBtYbZQDkB7o+yKWvKiIDrZzJrp2bFkATMo8
         OKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600473; x=1785205273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEfLpQZc0kvFMdKyhBfCbhreCCYuh8w3Y6+3at+mpRU=;
        b=NOFCJGpPAC4yyd7aQ7aUt8dwGuAU8sY+pkw2X/Hpba4IuJCjFbWKXelVy15lZ9icOB
         IhjPpMpNx0GulDYZE9nYWFyQCa5qG00Wwmma+jWJ+yCvNDFbnfy4NO67rsvipHXBIoJL
         wzzqiYLvAO+Mk/StY5gQF/YIX5UqlFXJfuuB1j8WrFbQv9s3NB048oHnB2OCu2od6NgW
         bgTB0ucaiIsWVfXz+v+CN6D49gJ49BN2w4jlf5FB1BuTRcn0Z/9de1trx5MUcfwHGzrJ
         ZRZkzAW+ja6NMrTZQ6ou6aviGl3NBmkSF/ya1wbc8UKTPnJ8vBBJiEHq4xXuACrYgSwn
         7pDA==
X-Forwarded-Encrypted: i=1; AHgh+Rpw56uj3Nw8SsLVELjShJ662j1K1lh8U5j7Xxt90VPuL8LQvXw7NJq8F6uG0zRFHfurz+tkEIaML5IrkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnJZXKpBJogt0c23vFH/dY9yodiTooF3ZkOyYm7Cn8dXoPzmrF
	zLQhIm5fBGDVlEWspGnvrpP5vfDHsTXSJydnTDxKxQUYEDGUUW4qrtJg7muld9/kFUG/UQJBMIp
	2mqhlqcHjnS3hkJbgNwN1KeXG3edQtePH/Dc9AixhkpHVdLaTUMu/YnqDoH9lPMay5g==
X-Gm-Gg: AfdE7ckWa7OnaKsi39bWD59GLXPZrpVNpccUTEjty0L6ItgC1W8HR9zFCTrgc0IFfpQ
	7X/e54EI1y8LvaEdPD8Tvg6KOqkce6NuroFZ5BqOTcfdXX8R3e9dEB0TOVNh+a5rYkctvaD+3Vv
	nEKDOA7+RCM8vmpeDj7/Dfi48hZXduwcSsa7/gXmCpuJWMYD3jo0O7Z8ZT2gbJS/7w5Fd2GlzTX
	b0kFgWaxjpA9q5gyAW9dcfu7PNgkkP8OqKQoB4o6w3XliKSP4mUVIPYJSi//s2BobSHCIHJWNlR
	FtIX5gBDoug71Vw81HnNWmNL6QcIMFTqfnCXhBT7LEl9keEy5pnpAo7MZ5hnLMW6P5Rm1Rpefgt
	GMRyi3UAcYxhtBn+vqMzneAoy+WIDfGHlCQ==
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr18355299637.53.1784600473229;
        Mon, 20 Jul 2026 19:21:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr18355265637.53.1784600472818;
        Mon, 20 Jul 2026 19:21:12 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41001457eec.24.2026.07.20.19.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:21:12 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:50:39 +0530
Subject: [PATCH v4 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-iris-code-improvement-v4-6-4395bd8acfbb@oss.qualcomm.com>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
In-Reply-To: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784600434; l=1008;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=3aYgHVIuLblZw7PKl4QOm3dcWSHYUDt30qNdyekWm2Q=;
 b=armaMMgtODSn3YSPgNsOuOJMe86tCPOlXNKtCy9JWPiLoUZ+kdvpbfbGGzh//IpMVvyNbFnz0
 oWGQQHVkrmtDhj+gBIQG7dgPe2XV42/KGqy/gh8GZCz+IqOEBvHsVsL
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: PcZaLZHC2CWhKV6A4De58MfNCoQWNxR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfXxoH7WzB7hq4o
 chTglNLfenGkzda6y3EHPLIEK8fGlAtc6Xv1VffhH+hWdZzfXGjoqp1ndMcNU3A35Aj2hgw/Nqz
 G3g+Gyy7fL4stfESpX23zm2Ez21c4arzXxDxRod+F8FJaXB8ZLaCLV2Xd9Snz6P3h9SNVPFE1X5
 Hbn7b/i6DxExjcXXKEH8yMNGKGy1w6OL31pH1+QxdpEk1qL/55dtKzJhwUU6rwhD6Zdhyt2aE6v
 zWG9mX3B643ln8Szjb4bkbNg54KXUt4ZyzBNWFV6/W1vtgPcxBFWiMBNkTHfLPdV5asZliD3Lun
 fY5vs6LInK4k8CKokb7O2Je+2rEW9ft2vkFAPhtxHjPhgOrgBtWLaFjMCC0YOnjwjKE3c3UQ220
 5UdSg9CoIPqrb0n/vfEXIZ8ovXNzmEALLDLXDEmE8SGo2ODvJmAnF0hE+DHu23oJJlL0srNUWKz
 DCQKLN8wfJ13zuQU7OA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAyMCBTYWx0ZWRfX/WeQFwZoKh3i
 xGvhS/rHTme0Rk2Ur5edthu0mznqWm9MzDaJapp19cSkl15d9jaE0H49YZO9AWOsoGiYAa+CMKJ
 4T94f/JyjE4k/wqIeS6v9Gh/OZuUquw=
X-Authority-Analysis: v=2.4 cv=daawG3Xe c=1 sm=1 tr=0 ts=6a5ed79a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=nqERTrTL3htJ2auDmasA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PcZaLZHC2CWhKV6A4De58MfNCoQWNxR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210020

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Without the break the AV1 case falls through, risking unintended behaviour
if new cases are added after it.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index b3496db55ad5..388a36ff2b07 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -764,6 +764,7 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 		break;
 	case V4L2_PIX_FMT_AV1:
 		codec = HFI_CODEC_DECODE_AV1;
+		break;
 	}
 
 	iris_hfi_gen2_packet_session_property(inst,

-- 
2.34.1

