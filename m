Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C822225403
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793209; cv=none; b=Jt1hg+nVKQlnz16lm9iPB4ZJLAEOhrSLR7C12qYy/FxMcQv2oi/wZZKfRP6n0b1pPJ9R42uyk+6KRVNsPibrLKSZPaLvIu3MlKIjtNjfUh07kvclKPXkdsJwnCG+XMkWKVqxwYQNYtu75iU75xDDFb5LDwJQRYjj9qYk7Qh4fQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793209; c=relaxed/simple;
	bh=QNrXSGT0/RU9FGBzR1eB633FR4BNgbJh7WtYPXkRtdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BoQ2NA5Z3FBQaeMec+qS7tjla6wdSfv6YoNXauASHq2H28U7KEr58gfB1JMkrd7cG1N+mCWXuYgybAbTZuG/lxF1xNIRJZZrNJdr7IhAn8DM0Z+6SzyboX5TrPWdWmiYaqaNRqhsjID34ytazXkySMCCfxTXk/NSJmVvo4+i6XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RE5scQir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMLKGWGh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RE5scQir";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMLKGWGh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J3K0121847780
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SI1Ns+uHaPcbeTHET1TQedvXE0lo2Qef6iv1Q3O/hNM=; b=RE5scQirmniXXNJc
	rj1SuLkxf3KcMnXjISSr1GGOzU/Tbf8zwvVRPcS6/ONl2MLTdTy1IukxUo51hrgU
	xj/bmTB54OAYohCVvwhppQa5wXwXlALtFONIk0vz0Sm4dejzTzmCivHksaAa6L/Q
	NyhPxAyGayGVfGSZEdzSmfq8LdNUUlpCz2Dp0+Pcc0gVW1I2I+4OABIE2Xv3dluV
	dL7hPxqmyyjP3o7mvw8G3/1AQbrG8V/IoItqyjCve1xAWuywSUvmm1inCGvXqO5+
	Ql/KmZ5ZtSyOBXC70fmZwy5uJAxMsXC/QriRzmQF+cABW1snOdmSaaVTpMI/gRov
	rFkw5A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs84a2ac6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 04:46:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so1369984a12.0
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 21:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789793206; x=1790398006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI1Ns+uHaPcbeTHET1TQedvXE0lo2Qef6iv1Q3O/hNM=;
        b=GMLKGWGheLEAVKSV3YQUqxNXwJ01LqeVNBtS2wgX+iYa8pY1Wy86hbfikFAzgGRDnJ
         LHQgvvCkdZGZ9zEeZSmLIXaZYLpW3ZvYYyY+8I7WbxIjpXalq8bNn/CR3CaEiLj6+4N4
         C28PvXGvg3JDqYBfonjASPVXQgnjs3iSsgQui0l9ot/pMHc8qE6xIfUgV5d6K0uJKSSB
         OjMySJdF7JSQxCKvfSaoM2qKhhCzG2h+QcCTQfryr04RDDClXQUzgCo2PMyv8zGEjVX9
         jYT+7jg0FkJu/ivHK7ZIxa7ROeq0PBBi2u0Sidek3uu6FzyWwpfdbzMgjh2SUp7ShI69
         f21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793206; x=1790398006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SI1Ns+uHaPcbeTHET1TQedvXE0lo2Qef6iv1Q3O/hNM=;
        b=pPu5PutKWEM4X6Ck8cdrWTL8H6DccEkpP9Z86E1qYF0wmh9jQwFGd0LmO3WhTmdo+k
         Tw6XOw/5HixpNMrFu5BBoRLzbzUUFTO2dxx5wbg1mQIA0j+7GuCqnPoLvc7lilXpEyFv
         0NViCgJAwOa6PxryEydR+Jq53fXgrHhVenv4y4nieEqoksU0pkFMG0GG2PmBbwNuoixw
         J4SLIBR2KKZ7If2HNPJ+jyTxWHJJIkAsy//BKkPfX/YJ/ho3FbRHk9eynn4NkMzF1DoB
         58bTxMiDZDNbSttgkf+31nFEpQo8CXQyX7F2yIbGE6jSu3Q0BvxoSwYBi2wK1wfVCQZR
         cyXw==
X-Gm-Message-State: AFuF++mlApmfkMJSdYK32LpPJfseJNFuHXYyZoXCS9gyWrFGfJZ7g093
	3IP1vhbXcjcazouG0vhqU+JwBp1bui/dHxDIP8Kf6H9wNdn7+UeSg+vrr6k5lQ1ARo0vz372AMa
	TyYSnIYFqydyWYyjZdTQCKx4ek3SVV35fNWUYafusozT+E3uFb44RnlZXy636THhf/A==
X-Gm-Gg: AYBFou0xhdcj3ZC6jgH38KiQt6RcbU0s9Rv+JU5a3/ubnCjLS3HJJgSwVG8VJjBbpaH
	tajviLI8tc0Fz9l23a0BfGOEebMwha9/Bp8B9lTE430qyAgkVSTZWcaUkoHSd77yLFC4cWJeRRp
	gOPX3DCvx1zTVZSegWYdoJbOsovPfg7NpwI459vWaHwJSKNlQgm2VwZBkc1+aElIhtXcp1PWl+e
	Icqzhf18KxE/hOBdsZO4hEmsXOxl/UoQ8JUDhyf7TG+bFH421f5STLcUqrvq3NyBkc8jme7McZV
	f3J/psQziw2pDGSqiFePqQaqQtrhx2Z87k96pv5FGDxmeqKsBYiyF3ZBX9yvEmDK1ec9A+7+TM5
	ViYVzNoaAE9Tz688g9NnC4l1Db9LLEl5T
X-Received: by 2002:a17:90b:2f04:b0:39e:237c:50de with SMTP id 98e67ed59e1d1-39e35da1f06mr12756126a91.3.1789793206420;
        Fri, 18 Sep 2026 21:46:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2f04:b0:39e:237c:50de with SMTP id 98e67ed59e1d1-39e35da1f06mr12756112a91.3.1789793206000;
        Fri, 18 Sep 2026 21:46:46 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm3839771c88.7.2026.09.18.21.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 21:46:45 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 10:14:57 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789793184; l=788;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=QNrXSGT0/RU9FGBzR1eB633FR4BNgbJh7WtYPXkRtdE=;
 b=Rnpkeh/um/yPQIp001CvYoCvjgiBi+CHqntQ7vgesxgSiR2a1W7NY3Ki3vcjm2ZZeZzO48SEm
 D2Y7IqZ1KicCUwo8tqwBK0+jXlUVX3Pu9dwm1Kfe5NYg8T1E8fIN+Dp
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: THmDYNoe3fjGsjDTLnjOx-Fu8GmLamUH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfXyZHysmnrb+KY
 lLZ9UtkEXJtFfCyshMvAwiGfS0BFILDla+wkWOcClzyihyazB2vU03bH5rLSCPNouxUaQWEz4F5
 YgHfMe9N4xh68cAwMvcLToZH89U/Jm8=
X-Proofpoint-ORIG-GUID: THmDYNoe3fjGsjDTLnjOx-Fu8GmLamUH
X-Authority-Analysis: v=2.4 cv=MLD1C8Zl c=1 sm=1 tr=0 ts=6aae13b7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HtMBSpEu5xi8YlTHYloA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX8W6jRPXOcoBl
 3gqo3RZXmXHKK/yP3Awlc8K6CfCpDzZu5WR+bEA7KHYKIdYsO9BjNY0s5zF/sMwzfYriXu6TjJS
 7lFKG4gYlkboS0Zrv0k9RIta8sOZ0RnOMU6qmZ2C9TC57YHA5Wx83pXBFSSgmwl+HLpZ64k4T0n
 ZIEZOqKyo235KvpUoz7AoOTtgN51dJWGAfxVAtsG+dr1VN44iSUzLt9PNKVBMj3u/3kxoTYvhRU
 32wyCY0v+ZN8CgZWUBNxCXd/F0QMVOd7SIdS8QE+cA7QBUsqH+4q+ryVYpmSMM43YVq6zSm6eVj
 EskPeKOJjPOvQs9NMVaHo7xsI/yZV8kVFsJQe2z5invGR96n+cy7IpsV0xQw9fvwPI234guBKzK
 +t/VwjA/SxRfuUwfxC10rtPrslXBMlJmMTR5sSVWdpKQWFRh9SxlHlW/bl7J0LDFvmMiv06w79m
 owimze4rmoiKWh39hKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609190065

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 2ad26902ffe6..98dcf57652fe 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -442,6 +442,12 @@ &dp3_phy {
 	status = "okay";
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

