Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065239;
	b=YHCMcQGp0owccuN9hDN6aUnQRybFnIRdlPr5SFGZpg+xIGJ7x3z9SCim3icWn2riiTMR
	 sY8xNRRH/s/7uyc+644BKeZzCuJFKQdjRrT50QXBEtcGKg/VyT8VIpx68zKA+hZ6YHmAx
	 ofofqnMMIp+zkHKkaYgx2QOjmSrzwTKlcBO/iDrO+1sak0rBhPkiiXhBOfYJ2eKnFM6oz
	 65WoBvFuickD/esNf5im0xJuRKLhK+Fiw6QoAojeuqUzebM/G3lQkivWwxeAVDU8lodWU
	 6VPX+rsO2Gdc7hIyi30rzJxR75aXjIoPGsjoXxyGWBNwhcANjGs7WWMaePfGMao5CpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
	b=zUxdVDOYlWeG4Q4TZLNf6eNInVz831oJ9/MsOxZcgtZZvUkSo+rtbvCIsvhnzbkym4qp
	 Jj7aWAZTcZSj9RWUkPP9n1k/XGMkfRY64SyNEglrzQjbtkLCNAT99hpnHIQmx8hlK2fkC
	 2xvnpGbAk63e4PPMWUBiwKiwOOpymrrWxPTGjvSdyMrT/vhiWJTxm1hLmXus6+oub1JO/
	 7rv05DCxPC8OSd93CrrXxdrQACYjxP+bsffGxG8M9BCOWRdL6SzMVqXHU0zDFaUto3hYM
	 WW2/dQB76NDcvsPkX+2WBzuswjuMKVnsbPYN7rVS/McTA+eH681+8nx4FhHpmgrPtNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fP70baho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmcRvppD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0642C60A261C
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 05:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0642C60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fP70baho;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kmcRvppD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B3b11215982
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 05:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=; b=fP70baho5vi8arhx
	Xn4biNEzc/MhGKMFJnVti07rCRdz5vNjrGAMV6vIhZ/JZkcYsCaeWovz34TVcoz8
	EVdtZcz8Befjj7BeBpg3LAzw04vnii5b8EAJ0MEOBGt5JOO+yhAi12MLRS37qh6l
	5v1MXk60Nlza8B3FLEX8UfI5YOsxWFqMldaAP2SAaqewnP2aW4KRn/VzmRc7D+ue
	D0RuUiqQi8sDrb+ISDt1UC9fLsd2yUM0XAf32MacpPXecJlx5tm9iz4lR1L6u3+5
	X1JfEYgmj0JfD9+FL/k/IxnaUzIaCaQbGM1Cy7mNzaGpVCM2kFyEoX9pWRJjyxet
	++ywkQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxctdtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 05:13:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea0fe07201so11726495ad.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 21:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065238; x=1795670038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
        b=kmcRvppDBhlyvg3obi3MlgamgMj5hQ8zRHeuMQfjoJuHqs97NMTGEcquY2heDTEG9x
         gTQ41XkDmTQpWZLc6YmeMKgSOJWwkHDp5JpyrxK8eSBSjbo1TcJKDD+6D729yU8EUQ+W
         RLKquHw4rTyNzPdhq+1k+YVI4USX9memYMhuDHzQy6uggKSNSglmqCCOIUA5bIDEvMcS
         //uD4vR9Rj4yUhInwVXbmWQeeNv96/LNz3U3VyIrnWvBzQkSGQrSdoDwOSQEp1pWRSKO
         CU3o/V+dU3owtCSGMZZu7tgHEKtZh2QQxMQ9a/XNT8D26T/tKYT2tPqRc9K/4cTzN3Xe
         amPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065238; x=1795670038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGY5ZGmhOXBizHed9rMQcA/AWCcPoOeBp+/wQG6MXq0=;
        b=TN/AWFGctS17Okl3cptjY6wjWvcLwR5PxPCg6VqwXGiCk9I9M5GSqovWnEjnV2htfD
         wPpZxghdX7LDjfkbjUZSGeyxjaSE83xp84Bg6QRUQCzM8INDHQIvOp6kUPuw0+5e5Aq9
         G5T8U5eccfRbi2uAkhUPbkai3XZpPI/O48hqNixmf1fddKgJh4SdZZ8vUUy12SvhQSqx
         v+a3qZejm/iAewlEkireQ4WwRo+8TAGmLE7wFBt81g8FRihQjwsTiRvR9kNSG+ibFO+g
         1spjSsdrBXJgP2eMuK3Y6ZjeAP3qHgkQbVgTtEhkTK7y/isZ27EC8EvRdVth6wUXnyVc
         Thyg==
X-Gm-Message-State: APuU4Z/WeHTVWbEf/7pBaj1JnOkBP4PYunpwgoeo0TDM9TuLhfisKFnt
	PUhYBMJz1iSBePILFm43RCw69zgwg3VT610Rg/7yXDfmIu8rDjl6LBmWoK9HVpd6gLLZKUXtBL/
	ArwnJctsTLEB1bg4Fw+pxBAEBqS6XFri5IFk5FUXMVNtEpsxueDenM/CmXXQiO3rD9A==
X-Gm-Gg: AZFdTZcRnP1wXbWcSpGenBzA8Z1P1UAEqd1ZRvkfIsFmf72Yz7ko715HRMSEy2zNTwE
	0HvK/QLe+oDHhN5/RNTz6ajThAwCfWjetow+IYTwGIFrjk5qxALZkTZdPegt0k/xwLdfVo434gj
	YsXLE/oS1vxgGU871fIXgUmoKYD7qcw8A0Ur/56C9WuZgkQJYrG1lSXxUpFbUQ7IwmaVGsHCEXV
	BSf37b6wSpCebc3dmstxldtcHB6iBSfiw9fXZksbh7LfeYYD+Q+WKE3J7zJz89LkngtZHuLsKc6
	h8BKbUVQuGJ9ZAShV0XSGkB8txox9mL6LO3itcJLApkc5v6lqkpwoajyMc+MDrpkhx1uI+NAjS/
	reO7YJdpQPtTq3Rz4KHEyQ9vC7wCXejkU7WVQhbpv+en1UMpirbUMV6t/t9aQc3rIbVjSMxhFYl
	9GeBOAv0XTvv8LGbUcLORRW/vxUcEjEj0s7NLxRAjR/L29oqU=
X-Received: by 2002:a17:902:d2c9:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2eff768f398mr46127695ad.53.1795065237723;
        Wed, 18 Nov 2026 21:13:57 -0800 (PST)
X-Received: by 2002:a17:902:d2c9:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2eff768f398mr46127555ad.53.1795065237254;
        Wed, 18 Nov 2026 21:13:57 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:56 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:28 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: maili: enable iris on mtp board
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
Message-Id: <20261119-add_iris_for_maili-v3-5-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=696;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=lhLLo1Rnt29vJGWnH0QVhbx6kqyGmQ/yrLNPDy0HyVc=;
 b=Cf4U79Rz1iV0SKlFCxZpD6fjFrewyq2fm7axjX+nag+IKleAL5x1/D0JHHcfaXjESCRyvrBcS
 LHyetPcgvLOAgraKKTziPADLagUkW+XCusmO1GY0Kw84np83EX/lRUI
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afe8596 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1_ts_jfFenCfOmJzNDUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: UM9Sdpwcaebv67KypndzHfOloJ8lSxGs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX3mL4/4qv6fo4
 VmSr+0VxN8+xWIWqapS+1FpDF7DY9+0T3JuakSmuUKWlJkzcz49DyA7nJLsqwqUInMFRRFvj+HS
 Zr41sqfcZ+yeVfBktTLKJcXjdoANsyQHiwKxh9HkS0ECqWdhPqV3in1U5zwNPkWusXyxJ1wtN1M
 tUweRKPUJ/ObDcOA5Cxl/zS1jVYdzUeoQzdyTb9Uj4fr/7bDnbdb7QOdQTCYBd5DmqgZ6z9JXKz
 yhJTIdjA17nXwNEBVBwoT4NJLOSEpI/huEwR+jrp7aqrUik9yg6sydOTVGRCAvRCWpVowwWnHGL
 YILyRmiXql8+vAln8v9Q4+QFKvD+5HSDI2Uhy9IzGzFXo4oClzWvsXakQcdrArXTRpL7TUeaBhE
 6L4196+mpCa+P4bCBHRKa0CgB1jJxGfn5cUVF/pxxOP+jttO368q0vQwricJlvrQ6D73iGcswYU
 UWrg7jkphja/FqI07NQ==
X-Proofpoint-GUID: UM9Sdpwcaebv67KypndzHfOloJ8lSxGs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfXzNwD9DFKHz4y
 MPB9qURO2bhqRULNDvrJts27NkkYjGk7CugaGJ0vgYfpbS9uLpb4Fp/RRk4w4nZ4MevUfYfirx6
 lrFhtD678PBTnJrpNDC/sf+SVs/yqoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190020

Enable the iris video codec on the maili MTP reference board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 5409d0a7ec2e07f1de9becf9aaa8b92db6d33707..22d9a420add7773009f95bc37f46f5201af7ab74 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -743,6 +743,12 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu40_p1_s8.mbn";
+
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

