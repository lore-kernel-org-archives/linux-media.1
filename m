Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78673FCB0A
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597827; cv=none; b=njkNRtk2GxKUPBZOmw0AeCy9sFLMVNDVnsmiDDMtzjzwutfMYMU3I6xuGinpsXaQuT6Eg7aM/nrA3cot3kOxC91jLb6Su4YwMYmk1r/mOLXHvY4VxAhm6XT2gZ9kDMl1egVon2WD+jma7O9DZ79jqKmiD72v89rMW7tCKXM4roQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597827; c=relaxed/simple;
	bh=xK4j3usEpsKJSd0XWcYMSp0QUpT7VmCcrycPbTzfVlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vuj29fnN78hUUCjPJDp47ALyUOUVtXzmuc+bFEuUM8m/d6v0xD1Io09ltgHetoiO8F9/XuIycK9c93lxzvs5Toh7BEjjEwMq2wl11BYTRDcp5U3gPtTzaoBhtYWZNgSm7EQiYm6cXxh9sSAQgrPgwz43v496YxiP4WoNg4VPgCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFtdAsZ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIlck5fH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFtdAsZ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIlck5fH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCSmA4107055
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuUAmj0mpourRJ08nB6peo+0qeAeM3hok9Bqp0x74mM=; b=eFtdAsZ0aAd9nma3
	SouQatdniBi7RywItBppC0gwkwwuZlFQKhdaK5ah2vEdKXXlPx3L9OOQda4F5nIh
	oFZ3HFl5IAqbZ8u5BwU7XbJOr+vMSCKEWPMofJPK6dZr9c5QIBrgcG0KoHY3ajQo
	4Yj62CtjNa5+Lumn+yAvznDwAmUDhHKx6mm02XeCo2OcR9iI0KxM9/kvzDG9MN2C
	iCKXmCiUhzU1zQXA++F7QuUpdNWQzj5f3KWq3UcuFRqG1tTiHfXJcsyhZQN1M25g
	v60CzhAlYGvc/wSCHpl0w0UrVzBveDoMVcy9tKqiSVeGXqeN2YUwW4E1qNbrHZRM
	OKSWJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn8eta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 01:37:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so37087245ad.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 18:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784597824; x=1785202624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuUAmj0mpourRJ08nB6peo+0qeAeM3hok9Bqp0x74mM=;
        b=aIlck5fHqIKO6ZDlA+KoRXuXXT1+ulGKUj/rEJsogojNePwsnpf1wXXtDO6Sigr4EA
         aXTiZaLf8MwIAuMOFEfBlVUqxjiH1U8tG4V6jC54ncs0wdoVIU6jbyLOscZkhAND3ZFz
         qT6bdWZf7EWq4z9OgsGiZrKBeiALF3rYDynf4AdXjE+ZVr84bFKgkZuNRPxq2Ju4ZgMG
         IUWcKIgpLrlGjEJALHZIx5f+RNgJ65Ul+kk6Y+uln8nsB92rOBT7SUR/UPfrMu0M8LUv
         5xI8pd5ST8y/NA5rZILpAoWyffj41+3O39d9wJAxI/sgQRGV78rptLxu8EVpuoL/uUV5
         c3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784597824; x=1785202624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuUAmj0mpourRJ08nB6peo+0qeAeM3hok9Bqp0x74mM=;
        b=G9x2lzoXao0pF8B/K9bFuSUZY/hYSYWMYz/lVTeDhZZNnJf6+BFXn1ra38Jtg+8pqn
         o/srqxEAwlyKbCDGoyiiRsy4CFEMoq2BO/G4HVtuj6PBYxUHFnsnW2D8+iUjeMMvKgbV
         U33eStBNZw0ABCkWx/r37XMEH3kgxRS00G79v3oG3RV43MWM7oaWYWOFHAVlHR07twzP
         JsfWOGcT283Jh3/EhBOhTag5GdKVimzWkuR5jpY45eStyVsTcJqM+x+jTm4zh58DE34z
         qWYnXs4/4GrJmxJB0xhJPQ+r2li/K/5o5hVvVQ/KeChQxHqBd328xJQ2ptdumRUlNIlV
         8RGA==
X-Gm-Message-State: AOJu0Yy+Fsa4Kyu8QgrnLTYR3uLd4+Yq5QtV3OnzbQ8G6qJqCESxtga4
	Qa3fiKW5G0KrU12Q1AN+5Nbj6OuCQVTO4jdnb0szLfQBXtNT1tpNDYgtkXB5VDVq2zZjmr3WuVr
	hKhqHJh0L+HBZj47rFPYB1NOTDFyBCnZkt2T4/vpPwF4ZEW+qw9dBcIDZ8WGmdGe6Ug==
X-Gm-Gg: AR+sD137QqTMj1iLDlHQg75d27Rdoav8yucDFnAGl1tihc1rKMgER+U8/JWmCAxQr3v
	bkeJUExJuFfVF2mW4K7QHQVv3gM6hUYUSViYEXnCnL9oSMR0VkGrCuQsh3/DGzFk+L1mA0Y6a8r
	4B3yhlabdb3losl5rVzk0eJgC30KSjJKRQZQMBirKH7LLhe95YesB1DTtBT8n56RpKU+Prx4hrf
	NiIJiNh4JJoA2bp+G46g38S0is1s7W2KyOQy47FsjvErdvbhNT96FyTYFYGgT+Rf2M8ZwhFPfao
	b7N0EbvZTZraIf3+2jpXb1w6fwhgaEb8fTd3X5WLWJrC7GoFo3V01oTbSmy3B9Qaw5pAmop6Lgn
	Fdl5E0WFe5/x+hJIWcwlUSmft7fpMdrO5MA==
X-Received: by 2002:a17:90b:3842:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38e3d13129cmr22414036a91.4.1784597824411;
        Mon, 20 Jul 2026 18:37:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3842:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38e3d13129cmr22414011a91.4.1784597823935;
        Mon, 20 Jul 2026 18:37:03 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm34630487c88.13.2026.07.20.18.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:37:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 07:06:25 +0530
Subject: [PATCH v2 3/3] media: qcom: iris: add request key frame support
 for ar50lt encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-shikra_ltr_support-v2-3-702842f1f3c2@oss.qualcomm.com>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784597808; l=1033;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=xK4j3usEpsKJSd0XWcYMSp0QUpT7VmCcrycPbTzfVlg=;
 b=P/uiAP9WNi7szZKyaG5sBG6j8VQLx5qgg8eQMB3EX1ahkLIyo96qLh/fIOjKzuOn8k/4myZ0n
 lz/an4JbUigC+DygJOjYNl5VZQFor9Kh8oEMze6TZEN9CEhnssPTjKU
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfX5qHBWXTH1cIQ
 GsPG+BhbiKWd4wgf/sCZXMt0BVlUaShGK0tzLE2fUBkp+8EQyFe2HBqxuyZzYaqh1bYja5R1C4w
 syCs8936sxQnE7qInDQlt5pGMDWL3k9ckTrRN2dRQbfz/9aLLqarmde8lZuWVw2VSOBtar1qaTP
 wDjL4Gz0zYnp0dUMEScVuzuGCMZpwC3zry1PHC6qnb/l8C/J/Vo7+0Avg/stNUTm0Rxm69BylUW
 JGeQULvzNsdE7OPmcqNtt+Cmqgb4e2jcXexM8CuAZoSkqP5VGW6YgnSvDpTz4VgGNtlFSmiffTd
 4QPqV0GLIrQeuCnpyJveAg9VH702LyPkU5qJHewyuIrKbxQYuGk3Vi27lYneDHkXLIPUWeQb8As
 TCq94+SOS10o05GYjS2DOV79Cn2gSjbx4QNBLNeaz9H8v15CdscbVynv/4WHrALVN5DjjxuiBwL
 F+Y/9JCp706AAq4vsvQ==
X-Proofpoint-ORIG-GUID: nhzhAhxotWiW50IN5338_oDYjYhvFTr5
X-Proofpoint-GUID: nhzhAhxotWiW50IN5338_oDYjYhvFTr5
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5ecd41 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kMRPvbZiJaxPZM8SQqgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDAxMyBTYWx0ZWRfXxCz6bLdNaX7I
 AvWW886KQ4Qu6hc2XBaEdfVqAtXNPiEg89xSM4oUXmWXQiMuGMzFmQZDXnUZLZYCeAPYf35btJ4
 1jrD0FlDN4AuDMdjXD8vPDfgZYNePhs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210013

Enable V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME support for the ar50lt gen2
encoder.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 3f82c4b7c6f3..39ad3fe2876d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1891,6 +1891,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
 	},
+	{
+		.cap_id = REQUEST_SYNC_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_REQUEST_SYNC_FRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_req_sync_frame,
+	},
 };
 
 static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {

-- 
2.34.1

