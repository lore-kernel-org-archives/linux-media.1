Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0993F7AB7
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621341; cv=none; b=Pw5GjrZcizYLdCpHlvffQXZnJe938LWainPrF/fwh8vGF5Tw0gNJyH8K2FC/5TbX6Y+J9B+HILRLAshWEO6r40tk5E2WVDjsa2h1ELEtSqDYIXBrrggDT52yD7e1Ima+hWiw/0M5yZYiusdwHVt6WbKQFeBttQrUafJQNFwNEzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621341; c=relaxed/simple;
	bh=Y9NxHc+xglkqVwfzuTXqVBNNH9QwhOHaAntxIH8RZsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFfnzUJst47syzPqkXtTwzos9dcqcExJ/sZF3KlRA/mJiBvVsDT0ARnBBf2Gx+KEBZS1QMWNJBauxSZdNAOFZy3CV5Qmc+m4uMeyYSfw7t2Wfx3QpKXIS+RDogIxccaM5ZvkaU3iNuj3Iajr1forbAb7Z/U56csFSUYqmTAKT2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0gNgBDe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjxpyLz8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0gNgBDe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjxpyLz8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2Gv841239526
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M3JIU2Ao7wEoQjtG7vqxKzMv1IDq7N5iVzUKdH14XEg=; b=a0gNgBDet3oawHgx
	i/i9v8FvhTE3LvDlxg6ieqWgsQE3ec+shngtIuwdHjo4hh20QrD3Gr8fjjOSzB5r
	DOlxzGqXu/Mf87CHx1P1rH/H2nQylf45U1Fv5VIK1E9Ndd/WMQGlDDTO5UdW31na
	CfTVQsZAYNW7PKkKjqn4QdoG5E15OWnRnTcy99OKmUdGdCJ09QvOaF4CTISZgE1P
	eZGcYvfto1ttQyRyo4DZnA0x3cRzostYxQv1/3PiW6Um6A+R0UoF6aDUiOAbHEmp
	fLTV+XrvT0qhlxBs/yINF1qArfuCFFmZD7DSlqlkvj1V1+BAPMWVdFHdHkIF2epd
	wdPK6A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m0hjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:02:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396901263b6so849689a91.2
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 22:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789621338; x=1790226138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3JIU2Ao7wEoQjtG7vqxKzMv1IDq7N5iVzUKdH14XEg=;
        b=BjxpyLz8cOD8+7eDwvEblc79CvSTnAxsLCyRcPrzZ6G+xjnvh9kdro3e32vm1b74z/
         +0ybbkes3XNfvbTv9HRxtRXQGpkL3yWWtnKHqNg8yb8ILfJgp+6ckxnx3C/khBUfTuKB
         ykNktzG3K/XGcExBUoUyGSMb/9Apg4O1t3lhvgJXG2BqwTIyQtOPxjctOZGjMULQ64Pb
         sZs1+n2dcgzWnPEebRal1hLyhgfZSWeXoV4A4n1xOm1wUuMDr+cFLIOi3kKgLlFfFrgh
         iv2A+9vPE56BMkRdDYO1goX2u28LKtSOR4NdhDJEAlWoEFGbxLUffhzxhKQJgSsVPyql
         FMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621338; x=1790226138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3JIU2Ao7wEoQjtG7vqxKzMv1IDq7N5iVzUKdH14XEg=;
        b=c6GHAldQXlMznEUeusEw/oRZpJZPqcFZPSJwvfISQR6YDlt0khYieCH1ZafWyHOuND
         R3Rrs1kzr9KovhhekvxBZF2Qx81BEpanWgjKEyHytmO3uuMz06rIeYabyIZRxchePEa9
         ESa2qAHpoLX6o8PYdVhIU2qNt66bbwlW3kwqIZSp/+3Ex+FqCjvhWddTbHT9MOO4Jnpm
         tC5TghQa99I4L9YVf5ID//hUlNEQ8xz7I5FkPXeRbXKR9PKKiqrEEp8ybBzLak7Nn+CZ
         ViJEuZbirRSFrzqLqBgnRVPVyZBObeWYsShBNNpr5Za4dwm2AvsAcOBBnntVjQLqBMWj
         +Qjg==
X-Forwarded-Encrypted: i=1; AKwUvBzETQ0E4ChROGmwUop+GTXg3weo8pw/us9r1m64X0haYemxYJFVBJLB0s6BO1FVckqi72aSoKPowHSFcA==@vger.kernel.org
X-Gm-Message-State: AFuF++m5UWzyRXcjybRb8HgIkX1HXkcA0Z7z8FtAovmE6T5qkl0OPxMm
	uKdlKD15103ENhsQE5tQuAuC4T0whLtruDGqyU/S08VcHeoSxwGU7H3+vdzfKTVk+xO7BzxDyZ3
	sHHtPvoTRheSI9ES6RZkUo/QJ6SK0gsGWOjhJjbXytZlb/sSQFAucXa65vjuBMv9AaQ==
X-Gm-Gg: AYBFou0XnX3fFfwLxK6XuqC6FXGejZE8/TkLdZnqP0rb11PFnNIQF5nCj31mB73ivxz
	yzUX5aUceSoW/mQXRs1JB4uw4k/hZVEa8ddq0A5yYPJqc/sZklaXYnWGA+p5nDHjo3jRw9HYbtt
	aQmRNpNsFITWLJW/ud6uOupDxEzkdxliPZzHZkzJ2WEUu9gIzHSn5TLmnXF6SEfuTDaF+jR1Ht6
	PIZ6mDUso8A1uKMUfPIPkhtfp+D352kgh/cOE5dYVTsgJx09vJVusgrMyDQEg9Jj2NFJz5onbfe
	6VBzHv/HkWf0/ScWYaHOP1o0mvqhyrK3G4BK4Kaau5aWetsE4frXvWPvIAoU/vNAcPKpGwKW/Ir
	gHj9zzKR/iJQoo/PqtzXUPxdAds9GOe50Hg==
X-Received: by 2002:a17:90b:5785:b0:39d:ee20:1e2c with SMTP id 98e67ed59e1d1-39e1e5042famr17381504a91.18.1789621337773;
        Wed, 16 Sep 2026 22:02:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:ee20:1e2c with SMTP id 98e67ed59e1d1-39e1e5042famr17381376a91.18.1789621337310;
        Wed, 16 Sep 2026 22:02:17 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm23544223eec.31.2026.09.16.22.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:02:16 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:30:28 +0530
Subject: [PATCH v11 9/9] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur-v11-9-e0c8bc914742@oss.qualcomm.com>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789621265; l=1017;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Y9NxHc+xglkqVwfzuTXqVBNNH9QwhOHaAntxIH8RZsI=;
 b=3U56MsFfuNyaH5fXTSF+gKX7NCUWQjZAG/aLF6qAe2JljJI4XoZVUwImGi0n+tjqEChuaW1XA
 KhWEvhcURLYDHfPTsVvgXfSCm5/9I1hcbsPjq5bFT0MSjCAL/G62b24
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aab745a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jls_Txh2LmBa37OkJYYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7YzLZ-HEEmOR7Zq8R84W4ntx-LTRApHz
X-Proofpoint-ORIG-GUID: 7YzLZ-HEEmOR7Zq8R84W4ntx-LTRApHz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX4PnwlwZPUWpa
 yUqcMhOhVaDru/WS3vyS+hPp3JU69eHuWeKeir6+3Wa1zDHEzSqOSYfgFG5T1EBon1s0zFLB0Ba
 14TN/6+epvPL2cXWBn8v1P1eC/mymfj4j1bupTgT7ZMCVs2J7ovcfnh5TWdfcP636YvUuErXq3A
 57DiQYlFYGmwGmnjFv5m8OpylO4fgdeF3PlmePRPzOm0DjtFR3m3CFJNWivoeP7K1cCIWxk+y+7
 By+wHkVq084e89B9ptRalQmWnOGyl8kNJA2xQPOOTyzXkyNCZlVixriz6JqPBsDGae2fl/VkUoc
 ABWUc+EA02dcyEXWNcTNTWcSrqB06HcwWIE6PoBrZbIm90dlZCkILo7za4E/yvcWIjDZevYcpX7
 AR/NFf4olUCXhG2QbZD1XzAthoyJK//mwSfyl8Je0VadmthSw7s8bTgrFTBAxrEn8Btz8RE1Loc
 x7Fh5qYEsw8jhiQ9raA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX0pCaQw8qV9hC
 0ATLQwZFvvpyRZxY8wSLvPMt5YupCYM4Gtsa3bnXeuizM7x9A1ISX9+CRqwEgN2mPJyrzpnVw6W
 tKgvJevMdWBmQRKenXG73hvUrcDBo98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170063

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 4df3ccfee106..df36e3ba9816 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -694,6 +694,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1

