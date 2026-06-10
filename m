Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D07F380FF3
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073089; cv=none; b=GTYoeRylF5pZc2Cmd3BJcGGRcLAiejR2avdEs8KmUFN4hUQJ/wwAx+/8Vr6H5njttLRwF99DSkTHCuHdB/enzrPDUn1dEYUVslgRtfjv7NuMdXgM9eNlSAqa8vP1zpdWXVdC1JsVWFtOhDZbsMbXhMEPXaRuEEJRlZwHUyhNDRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073089; c=relaxed/simple;
	bh=ZedtRlFClaBXevVNFnYB8UGxbyP20S9HuW/op1IPHAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jQfS2XZsgIHYlYw0ueIszglzlPhThffX5pB1OOIxjkD7Ie6Eqo5DVWG1wnb3s1VivChTEpeUn7jJ6k2PAlqPGM/hdbOK+EPZVXfgAoL8N2jHDMNMY3KdWSEFg1iPEAEuLXTQXbkYMJU50JBUSAz53xMpfN0kMipvHjvcyRTbP6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5qyEq1+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hffsuxSq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5qyEq1+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hffsuxSq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ei434061021
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=; b=N5qyEq1+UnbsZLJE
	kbq5HXF7MhaXbGyIcPLvCrVSXMwTCHmw9UsPgXruBDDAx3BAL1BK52+sjVlbPpYR
	QfFjXpqQMTBSQ+hGssN2B5kQmq/cMrhaI3/WlGYiwXuQOTW4wCWG5wqumeTANdX8
	9ya3VyYvqQb8+kJ4JHEoTaVDStGLrVonp/vDHEqkup06oULeTiuCR31XGAX8lx7a
	mtPTDON2AAWm8sO5CN0OE9Nj7xVqLhQk3GL4AkZsG6pp+txK1wWpt0z6qVFmdtz0
	MBFS8YxkoPPGMvArYIjy4eJzhvxfjCnU51MjBGPezH8b3i8KxEe67gdO9GWJQ/ki
	O5asPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh13b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 06:31:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso7197822a91.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 23:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073086; x=1781677886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=;
        b=hffsuxSqnqMGtEUsngzZWOhFA/kcNsXOtuADkRLRKIWliA6fidPFph+TRaRPS5cpah
         EZtHU4oXTL9/5bsQe66W1W0YGaN7NU/9HFqP1rB3g/EgXEGWfsjp/y+LTdUFkgW6lxl0
         RjFV4ROFJzgxuAbe5ZsE4p2pXZ5j8GEthxbtHBkrFP5RwtH0cjzG8a1f3b8NkGUTp4f+
         JR8rroF69+dopp96Ql3qriMYi/UdzuqpseswbQ8x41eV927Ceu6r52M06Oqt75VuvmD/
         y4w3N/UZMhVZsxcUmqWLSL86KjTt8fzdhFOE4VIMiLVikM6WZKOAbtm7Kbfdk3VWaiVx
         zFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073086; x=1781677886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=;
        b=kPdfgbF32OFjtfNt0iDiiF0C1pF+chOlF1oRalmDW4Ib8ScnjvCz4GLLnnBAXZUoz4
         mdC6DbMV4s2ySSySS/OAEvcF8VrQxpgqL1FyBXOex40Qr0W4c9F4VhiwdZs3ZXWBY91v
         2YHbZ2jCGAeCwXoUiqAT5ezELPu2dEr0befHCsDcaKT1igc3HncmenWi4MR/R4WAAqbD
         ZuZ5yFkGCLKNkj7Xf1je/KTQ+MSzDlkovi6zOWhNmc5mBFCXoJdQDlCE7K72vvBsesy6
         8Ovr0tCt+enurDEI4lMeMkTwe/DEwXXbqdnu85MUkcg7cI74nQJWu4hp5CZfGLkbPtxB
         llqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PRbvFkYS2OrnjDgVytcuUxP4myUwB1SBdLVTDYkvffEP6fyy7TwHlypHQ2VGluXQBGfizcHe88XBcpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+5+/JZ5FQ+WAwNmtwQbWSDXVuAZP2nPxVRdy4rPzOFOGU6EZL
	TU7ckybUukfD7SrsAMV+OhOqD1ls1oz4iyPWEi8xT+qNGImgUGhZTOiGuFelq6HGoywu+HpDyDH
	WRLuFAZ1UDppw6QufbWMrTC0IHMDuogbhWaPlL6dY0n4E78xsaa9dzDWzOX7xtSVYYdfqdZnpFg
	==
X-Gm-Gg: Acq92OHoFmo5VSNVqK8kg20J5TOKk4Zor9NLfTbC80z4Jpc56vnSjbsgD9UscoCiECw
	kYxUkMzEKti6WGRZREwKD7MZGgXW1SZpe2vC5pukqUraVjRTMP2QUlnWMkBNCo4uGbXf4+6T7gF
	Ufl3d5JxwuoFGVaW8tZnAj7s5jOW3C0CWq9POYKgr7bROdyj5jnEoYzV4hAn8k7rirCJqPF7YSL
	LqZ7wnCDTRiRPkW0qjxTeARozo/GBDbo0MGKREu+cfba+tn7jxfOGOSR2Q2Ydq9J0GP69F4jAeX
	AUCAs3DMd39VsOJAsA4HNa/vdbj8tShiqM7EUYO8gTm3tJgXeekyLFZphbg7phJVKHziufZcbOI
	Ip3b2Cubd+6smG8MtHJqI2iVZ70SnlBrgZ+YL9js4iJYheWccH50lCHIylqkKtSZlRw==
X-Received: by 2002:a17:90b:5806:b0:36b:7f69:c152 with SMTP id 98e67ed59e1d1-370f0095ba0mr27626881a91.18.1781073085879;
        Tue, 09 Jun 2026 23:31:25 -0700 (PDT)
X-Received: by 2002:a17:90b:5806:b0:36b:7f69:c152 with SMTP id 98e67ed59e1d1-370f0095ba0mr27626850a91.18.1781073085422;
        Tue, 09 Jun 2026 23:31:25 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:31:24 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:48 +0530
Subject: [PATCH v8 12/12] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-12-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=880;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ZedtRlFClaBXevVNFnYB8UGxbyP20S9HuW/op1IPHAM=;
 b=FfTt8eRCvP5b2HGq9cfYdfHZHEb2OOf31mknyWFHcXDKbGLqsavlBfR/mfKut5rpe1XC7wYES
 7GxoxcVrpV7AJ07VjbHxCjO1j86CkCt1pZUOXn/cwlImdS5tOiO5F8z
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX2A/RelNP3aLt
 QUwlmDaO0Rs35wNhOv0h6tBwlGrRvsZubHN88TCY6nh+pIOFW0g3X6qZYpq5qLbGtJaKyReq2+a
 BWWkiIXal5azl+ItpkEKFadfAatY+LIvGU6sL066nWCugBrIRAvBn4w3FXfDLDMc+KwkmC9bBvK
 uaYDRAqLR122CcjCJ/xbT+3PmeJvLjGWthrbOXQxSEhvrHL4P9Oq1EJbFAVQDwA1+oU4yInCP0V
 jVDP2sieuDpQq8/FxtIAqerUdOt4SIshOKzvW2Onp09MS5ch/aw+nG1Er+FdeSAQ3P9OvDilguL
 ywpEvG/8SaANuS1hUFNPD2WvRz8HIpo8ocDTwqKIkoLKU+ubcYbpgghGMLwiBHDb1s9PacA/tdJ
 gYgY1accE+bBfu8lQ14a8fkt3rn7ksAnIcf+L3iOx1BgLbBRDejvdMCvNrEMh80D9Bnsf+T5Lu4
 Otq7NpWViFoz9YV2rzA==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a2904be cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: R6igQ21SwNWSR8COBvcOH6-_JT_rPyAh
X-Proofpoint-GUID: R6igQ21SwNWSR8COBvcOH6-_JT_rPyAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..9445badeb18b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,12 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1

