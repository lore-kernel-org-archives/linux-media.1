Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391607;
	b=H00+UaCmvlyvpAijiMMAmkBDbAvt4gxwTnDmwE40o+xJc8awvvJvrJLD93dFG0Tc8mAl
	 0A/cSSFwwHYTwLyLI/CdQ8YNiRdrcveVwWcKB/TidRNjyzB/93q+5swpvdl6nsjVvgVDh
	 b+ao57MmjBYC/K8UbwrCC53EQEwjxuD82qH1Zr6ULBfWVOAee1JTVBDcfrmCsxoEiSN0N
	 NbaczGCN3+iSdNdsIdmpjXAkobu+EbYYx9lhkYft0TZrFMNBxbxWR9OosiCAEP3bfkK+7
	 yYKxBH9FQGnaYpy/qfk2coZJTox6YKtKDpkni3awoqEQDhg2zm235lrnH9QUQ0cSF5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
	b=T/l0h+NAv+tynQbs1uPCRLzsG4UH1RRCpi1Vt9YJDwsSGT3b4gXEqZRwtBhcTzwluM1B
	 4b6Qn5bDyVyVfXx/Ub2zdYiJsWau/m+f3hTbBik4GoT7aSBDT6GoiT5kFlkmrqbE76Vmg
	 vfpw7NUl4GqCeSWxqcXl/PkFPkJUicwFUWaYA5VyuBB0ANUbI8ybrCXxbW4NGSxWDBS8G
	 fBTxgAnWZp6RF/JGNJ9Twk3IxxEO4u2aYTjKuVAfuM+R+5/gYl+2l/+6sei+3elpi3rgg
	 LqA+GLbzlnlU4q95Coi3Oh2GlRIVpE/7g7Rx/5/Pf8a0XDzZVXNbBkQYxSrz2PvVoxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9PCeNAk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MZ56mWVE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B0606A320
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 827B0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9PCeNAk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MZ56mWVE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIiTei3777761
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=; b=c9PCeNAkIQY7B6SD
	CRKBDrmMKqxNYarijMkARimArCFg+5WcKzR43Z3j40ITGS8sxFfqbOtG0JZcbBg1
	mK6Q9NTbvljTcErpe6FCShVXCqo86BSrK0rrW6W6neIIMOA0AntP6Zismkhk6GgR
	aG4mpfXZiEcwLcGa54QEPuQcElxWkHmRTGTSozemjkoh9ScZGgyJFsbuJrmwNkU+
	IsWuNF40mS1vbR7jLwu1BYQAIA7t27W/u69v3CjxAQT7WTZEX/SMO7fSPZ1Qc6jV
	3Xjcu/KfwfJKBcY08vxGlvgW8PjidnE681izC5H4drJEFTJZ8xMHC2BNT3LRg+cc
	VYosjQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s9r95n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 20:20:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so2533905eec.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793391605; x=1793996405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=MZ56mWVEppdaZz8RCG5V/ta6hnwFCY2RVJyr6F5wCcSIpgnvf8pABCXeXnEz43n5BV
         9DvlPpzCBqXlCAQpRTZYTy1ARnMSvLCb/WapYtHMMY0+eKMgRKSt9ONqgd22IL0SBBaK
         U9sykCf64+RM9L100is21PZtQ0VQR2zjjmBl69QQsh1fIulfimdHWf6mAAsXmDO1S4si
         sG50pak4cfYUSq4/JTLTFeybQNIZwmyb7MGWT5BVCUO+JMrxJBjqdSxQIljQvp4CKpef
         zPZ7oXe5wU2FLfjlRdXviYq0Tzp+A3as7nLaNHuBwbq5N/YNK1//hZoJivMVObZkti6l
         Obsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793391605; x=1793996405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=hmwvbnuTa1iefyiZnZ6A9U45mnmd4g/E9YOJiC7Krk3DoHgoYgDQFvn0dpUWy5/NwG
         Akzy5TMx517IdSLGEo4somhqVlWSVFvTT9KVsUkGPSrmsmijr4QC7etVW/KwVaAPCYi9
         q8dEnUwGrNZW2ZjirqVH0PFibRZp5YQ4dWyA2bghyylip2Pzb9DpvTj2yqTGBy3ts4gT
         2IIWuTQfMzXPTAX87hsTZBFeDgdq23laCoCRmlbaPWC6wuaotOosU5H9vJI2C4tiRKS3
         5iPmNa0sgU49NRD+bJvbZiiBnZrQninYWm36nNtF6Y192jsIUY0/rRcsFS2zkjt53h2i
         Akfw==
X-Gm-Message-State: AFq9FYLSSYwhSwbssVjZi13EcOedXAvAmTc7hXN+buA9fPlZkDVCD7c9
	/xMS5UZ1fj9PiLbADJkFtv4CUGKGLBDzVSV9qX+e7mrE9z5SYV8CugseuKLNTJU2cXCzFDQ8OAU
	fRY6X6BuYXbzwsetCmtJny8+XeLqYNU5/9x3vGo0fKWcTaGQRLkdMEM9RI3x1D/C52w==
X-Gm-Gg: AYBFou2sSd5eclPxfBoDXbConjVIYCdPaRJXu0DZFzX5gXVHt22IsJNFBqB0aT5vcSK
	g5ZAD++asLudiyV/q8NarJBZeWGrO9XdgvwtHuG1dZbgo0njayfjq9ueZJ6eC6HtgpFSdbSPwqf
	yrLHBt81QPp/71gw9YNzHP+2GJNk/eDHxLc8G/Qg6EnI1JprXKy5ZMGfJAfyXsTDDIY0E1D54jF
	enJ2w4RL2P0FVHnmryXtvesh8O8hN2e2UioqC15Uot+wTeuEVndIOjUQAMt4YGESMhsVCu6XkVK
	ctC1PuQjgl/8zI9ZFyyc+iB9+Xtt/NzZZQr/AAK5KLBFb+Bu75piQynzfWHsy522X99azRy0bW4
	mYXvCD1uXtkZTBSqo8nUrm0Jki9Wwy49/jx319uWHimLbGWIqWGQwJyeiHASPftbOfhCr1bkEz2
	jJdsG66Q==
X-Received: by 2002:a05:693c:65d2:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36a423bf43fmr4432686eec.26.1793391604389;
        Fri, 30 Oct 2026 13:20:04 -0700 (PDT)
X-Received: by 2002:a05:693c:65d2:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-36a423bf43fmr4432655eec.26.1793391603841;
        Fri, 30 Oct 2026 13:20:03 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm9300197eec.0.2026.10.30.13.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:20:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 01:49:11 +0530
Subject: [PATCH 3/3] media: iris: Use firmware reported count for output
 buffers
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
Message-Id: <20261031-fix_dec_seek-v1-3-cfedf0c267ee@oss.qualcomm.com>
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
In-Reply-To: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793391582; l=1644;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=w2OxykH7sbFu9wsbTswZwhTlE3jYoJAIFTL8aWVq6mc=;
 b=/7IpBs82XJf7ZOkyCgyvFgHeKM15bwLLOH6zmIi1T1B6daJbr34n7vn2DkScsKUm+/zR4obkm
 udz9xSEoYXGDRx55vAjNN/Gf8K2dX35xni5P4a4WOyhkmfiTtif480u
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=bPyDs/+Z c=1 sm=1 tr=0 ts=6ae4fbf5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ngQ_FiyG7nPeVDEeuhEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: mMyu42XbPXORZACFfGsbtNATeGTyYOBv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfX5+LN7q8D2sQl
 Ey2EZj24gH0Varz9Dq3AUpbyU45bvQm+v/IzzvX604Epp/ZVLQQ18B1EiC3tEw+Nka7nfxYyvas
 sxOe4g2AwLKBu0V9oRS5p1rUNWe65VuEloVIeVVsLS4vbq4yHy9QvUnpNvtFu156YfXLlo0bOkM
 Oq3QmtJhpkF90Kzm5Gq+0jDTgVWpYEiexxSGeFhW8ONcvxiEvk0cA3FE4yf7vyhgts59lKxq4qf
 +7ggMHsvXjbXLoUjVySU1PjAbpWpza6dim61pq8YEFU8JUIbmoOtnOFT2uK63ayh9IUieVMPDeN
 /IrIz+BV8fSVEVl9caj801iZvgpd+PWjoXSMYO/BD9Jf2a2mRqIaYntrLoYTHMQCnwgPxoYZaXm
 pWv9oCM6cLeueYlWVTUhDOKjsnmds1yvusMzACiXDA+1aJ0MdTmLVsWJ2RJfwb4J9NovUb/56/f
 htm5fP+FAVXYWNot2OA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4MSBTYWx0ZWRfXz7gNQxkUvjQ2
 l1syNkSIA7k3lZB5km5C7xQ/EebdHnzuYZH5/BK2iRmC5OHPblblOQJZM9i4Xsm1s7YWk3jYw6T
 M4BeWJeX8S3g93zbqu14wBBtwpiApt0=
X-Proofpoint-GUID: mMyu42XbPXORZACFfGsbtNATeGTyYOBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300081

Once the firmware reports its minimum output buffer count, the driver
still caps it to 4 for VP9 and AV1 when split mode is enabled. After a
seek, the output buffer count can be lower than the minimum required by
the firmware for VP9 streams. This causes the firmware to report
insufficient output buffers and the seek operation can fail.

Use the firmware reported minimum count as is. The driver calculated
count is only used until the firmware reports its own requirement.

Fixes: e1f5d32608ec ("media: iris: Add internal buffer calculation for HEVC and VP9 decoders")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index a8170e5fa9e6..57467c952f42 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2375,14 +2375,8 @@ static int output_min_count(struct iris_inst *inst)
 	int output_min_count = 4;
 
 	/* fw_min_count > 0 indicates reconfig event has already arrived */
-	if (inst->fw_min_count) {
-		if (iris_split_mode_enabled(inst) &&
-		    (inst->codec == V4L2_PIX_FMT_VP9 ||
-		     inst->codec == V4L2_PIX_FMT_AV1))
-			return min_t(u32, 4, inst->fw_min_count);
-		else
-			return inst->fw_min_count;
-	}
+	if (inst->fw_min_count)
+		return inst->fw_min_count;
 
 	if (inst->codec == V4L2_PIX_FMT_VP9)
 		output_min_count = 9;

-- 
2.34.1

