Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304710;
	b=NTIAH5UI7RP3gjy3vTJyiZsV2Qgb2ghnOpb39vncIzovLt4A8Wm/pdqfKV5JYW52pgmI
	 /Ai4chP3exh5CXi09hBybwRdZsZ4RRKq3F7S0X95kKMLq863e6UbDEiyLORTLB2vDK2YQ
	 TqE1y5vDsDXfGZkAjAF4A3e8dGl29ufLA6r6sQ5p+3LJnaf4CJy0Pk+x59lnVwH3vG5Eo
	 lzu1iqVLFFB/ReSuLdyXCCYoUDTEhebpicZrScCqz1WKSPFaLonlRmabkyKs66piKoryl
	 cWmra+qJ6Tez0djdDjk2VsN+WXhi3rW8QktfvBw3Gfvp3sbI1F7NBJ0uPI/DWpTz7YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
	b=bv9HpTjA4Hhi93vLMHWH/PWZnTpn+T56EpFLZ17DHtkh8I7X/4ptlJ0PnW8c8q5qvx00
	 aSvwym6XiH19iuxf0hp2/17UEl5Wi7O7VyvH62mwYLK5O4xcCsyR82R4QbhsX/FWytve6
	 6yTriPE3l26K6YsbngqjFp8x15TtwoiQ4VUiK7BTVZV+nnx8/BVAtmOMpJ9fl+3T6IpkY
	 D7oEvlZXWulShMp6ZixPNC/tdKc7IWD3vl/uGz55ihp2vVjc6jAICwnAbOqwoLqdosiUx
	 mXzLpoTioy2DaBYKbV3tsxm50KJpj0Ov+TDktJT3Sq/4C++P664YfZPXEkgAMLbEZzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nCBIJFac;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxArq+YW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000FC60A2614
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 000FC60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nCBIJFac;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxArq+YW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8ZcVm1916844
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=; b=nCBIJFachyn1nAcM
	bfTG/ySiVrCPW6gSlwvWhLPoutyqyBjmCNVsk8fhT2z+jPiTMJBCGEiZyw+C8cVb
	FoLFQjsRVP9oNrcaRr+jkwniThjiV7ovDqRpxxVAIY8j05mKOq+UpgVT8jMcYI03
	U/VAunD6PTxnFsvqSb3SBiqX8Dtqhr6RDMeUWKhhlNl3gf9sl33uwxmvy7M4CBCK
	KkHKKMrQFUNO9T5IESADpSMEUZxGtnAklT2bYDJ1Ph1+Bbh4NR+hEdBqnCvuy9QY
	SyUONvR4jdS2edncRq4nezYLHMqHuniIp7w9Lf1YGrkI/R8nQj+nqRSEzZ+3ms0I
	F4B4CA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw48a1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:58:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso1049384c88.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 01:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304709; x=1794909509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=YxArq+YWom/w/tDrNMK2pE9uxOiRQMMdH8tRBNf3E3uYjNnK4DVkBCHLn+OSaUtcvz
         Uztw4K/OXtRhw0ztN2pYWFfNSMPsBbVGegueC7g1ovsNTpjjkt29UMvQxjBeN+ZH+Guw
         W4aFswJIiEiuPUTmNK7K2Y8at7MMV7uBDhIBXN7zMVHINdiQvabtGNgWWvLHuqmJOJmG
         NuirCR1ob9AfyhuArWE6bZS1pnw5p8mg/AALOWah2P/WRRIm5TbNgCsl70qmvt+qvFnB
         hxs/+4iKc/Em5N/mPHGLiON1yp1C9tCvThbAesUS8dZhahmBFLeuEBQshRHzGYDedYLd
         pjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304709; x=1794909509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UlnOQ4rWfQ9gnpZWWY98Nt3vJpS1G1p5S4K2DB6pks=;
        b=iKO5Hgvvkhs7vwsdhSpHKrKuDB4qzFqQQ3Qb7IGNLzJlkRbSnt5TXBsfdovWWVvhNf
         MUJ90tnCmj7An0crVGDBNgX7E8yBseII0Gj2z53pVOAxb0tbRRbsZ3o4581/tuJxNe1D
         Y7SW/t+gxFG49wgf/miyJlJw09wWvvFKCwcws1vq880MEoYlkFAkriB7tBfqMs3M4Nc5
         hPKBMB1ddrhpcPTJIDa59vUddjeI57aOH6QV7JX3Ux/duMHkvxyJPUEahkfs2CxBEjgd
         h93c1SywRWK1A6n5uLDIF4nSTX6aFqIJ92NssTKyWI5S63atOeyuYVFoPmxyT8wgcY+q
         w2wQ==
X-Gm-Message-State: APuU4Z8V3fmBrb9kyGPeDWI/Ff48wUdKWItqA08S0Yos5JeHVjtgsuvS
	PhBQLG4Kya2ESpm2YkpuRZjcEYRW4kWmwA+NNBIDeTf9jWLTKs63ybzEVAHw3D0zbvnWTqd15qP
	maX7C0I+TiiwnimjtP74VontChIm6FS+cmuKMlx66eDwl7c9A3urbnmm26uKDNHKDyg==
X-Gm-Gg: AYBFou1YLHe2cAuAgnuTt6Zr/Own4JPXg5yhwbxI01iRNcXn3tVABS9Hhi9sGTFsqXi
	zH5v7BG5GD4Qpr6wpeeGUeUD8XJ+MCWA7ZOuBb4u9itEJwwpddenNkplNKhkBAaoL4U4/+vykzl
	IYl8W/TiRhZgS4foDebV5rfMY6+qcmB0FO3mUGCqlXq86HZQPsjZmOvtqPrvzS47BTNzGunNCCK
	C1bjlR5kwoLrFubOF25h8UxDitjYScv6mb8FUn/XVq2yj6i6szrqXWy1YvSAjsQUD40d+SUsvnc
	DQRqFoKSanoVK4WMR2TYfJgs0MkhFYhVbyqJkSQL118WT3vGsXDdWCvdT1CDxHsNdQFWbP8K9lv
	W2RlWlWf/HaAXofito/jVffigioB5LnHLKMsJb7yLXH1AzszRnQBumvTQe9b400rH683EIdGStY
	uMp2VlWw==
X-Received: by 2002:a05:7022:3c18:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b3b617f6b5mr2779897c88.29.1794304708408;
        Tue, 10 Nov 2026 01:58:28 -0800 (PST)
X-Received: by 2002:a05:7022:3c18:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b3b617f6b5mr2779872c88.29.1794304707825;
        Tue, 10 Nov 2026 01:58:27 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:27 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:27:15 +0530
Subject: [PATCH v2 3/3] media: iris: Use firmware reported count for output
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
Message-Id: <20261110-fix_dec_seek-v2-3-210d8c4fc31b@oss.qualcomm.com>
References: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
In-Reply-To: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=1644;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=w2OxykH7sbFu9wsbTswZwhTlE3jYoJAIFTL8aWVq6mc=;
 b=dnMxMPuhvVOA5TkV/Y8KsSgljPBw02l4Bf1/AwRdFsliQ35CijLJMXKxTHFymnUYrWUOItdbA
 HiE0PHibsA5DyQdP/mIBIMC97Uy1hR8/rPC3ayDjMvk0ybhLtqAHtdj
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXxd2ilEdi3g9m
 1oPojv4R9/gP+L+FME7i/BQ3CO6zessGYBPbcRQUrM47TfbcTc3tqOm4pBbF1DzxXe9yvOZ7uUE
 MZoqXpmLr3TJsC2fepgGzT/Y9W09dl3aaUCuX/zYL3xY0wcY/8wfT1hOuBC7zWl387XUo46InK4
 EVMB+lLP6XMhoq7dLJJtOI05wK4LZtDxLyrXgG5QVE3B2Ul0s0NttorkCbiwfsUBK7+HN5TnVje
 62HH7Zaj7fw1dwO8fFaCyNegyRmcpoNgx6V8fkdu9cU1hNhr01cN9thKwt1aImR40Z6JXBTkdsR
 WjeOvacQhXhf6Io8tXT3jWsyDXFbBZ4HZZi6oLEBkTKCQ/kxBx+M2VdlFMMPF6W6vBGf9FtZT/n
 xgkrtdj+A282iYLcFkS1v58VIz+THF+r19fedEW45OH+E0JgSY4XUajMgS4vGtNE6eH+vL5g6SQ
 m9tgAg4q97qg9pLCezw==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af2eac5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ngQ_FiyG7nPeVDEeuhEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX4vROkDceHS5y
 xuBYVIc6IGvioDCDFM7gyShurxaVVruGgOiBTU2A7R4ZK1vURxihCeoluuD6CgZSlH9Lq7+M5CJ
 eUuPvU3h1aw3C0QD2ZqvSYAnMhDUStQ=
X-Proofpoint-GUID: 5giMMrBOaaoahgkHZayM_z3YbSYE-3cl
X-Proofpoint-ORIG-GUID: 5giMMrBOaaoahgkHZayM_z3YbSYE-3cl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

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

