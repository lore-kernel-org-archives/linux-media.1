Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C551386C9
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091143; cv=none; b=h1s/MCa4KXbqXq8SlJafdf0OcTB29va+oki77LoCmkM1ULna9lQcrCLlhMRV/CB95quGUK6DvruA3mBb3RGUgEKNyziv082t6+UM8gHfVB5oJrkzvyt4gxsaCF1csIUH/1u24Y0FZOE9WNArRIHXsAIw7LPH1AVNEanbK0RpkjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091143; c=relaxed/simple;
	bh=BwrkrLsH1U6pF8sgcZ6o579AfE/d71IHNQRMfwrAtyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbSsdEsUECpx3IXuEiZ/o+1T6KHjvJ4ilgiIUAYHzDzwP/MxeWRKPXvr9fGo5E+aycNPcC+cCUFttiQQMve36iBBQKlRgz/iLnH2USnOqh3YAXaT02lg4PO5eQtl/teBPNK5ZXCiRzJK7VRlh36g2MhpDvudngWFhH4Ft6XSPjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hitv43Fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRZe81by; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hitv43Fh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRZe81by"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777o5n23822033
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 08:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmACaop3NpP/tkQpdGI9o6oXEIytD3NJ1p1fSFW/3f0=; b=hitv43FhHtCehEGE
	Oa9hpGc1WezIPAIXNIwEpmR569M6Pqd71wa9Xkn6T5dddRD0ot8ocCf+j/P8Mw0+
	VUdcASYRCr50pK+bAcCriJbJAY1DDs8j1Yt25/MsEW1qmwdcT5yp6kjjlHLQsikP
	GTKb4Lk4tHnsVlQEGvFGsS6YRgMA+C3ZDYjmqs13BSgWajmEX8w2t0jvrDkM25pV
	MJjTqpl7BlFiyR+ep5eGv04Dbh9MPaAuf5jig477xSLgpVeZAskt759PptVRIMQ/
	giIQdjhugYFh4XJimvg1NLT9kuLbUmU1HY8HyxF1xuMEb3wqtG5kxzUrj2ZsEHQ0
	fSW43g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gu1kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 08:25:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so6512697a91.3
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 01:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091140; x=1786695940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmACaop3NpP/tkQpdGI9o6oXEIytD3NJ1p1fSFW/3f0=;
        b=IRZe81byMTWSroZ1W/3wr5T6fV8+LILXKFoTPYt2A0f4yvlalkfyrorvxfXSbR8tb5
         AsBnWfPG1e/soKfQYq4o8yQGDZB7HkC7/BpcCudQKpns1ZLdmqVcWCFi6O+RFfCTcaNH
         mfi9W5LcshwV2fae8USsj8jMDwq13SNcjqFdm9PxVWgN0Nxi4X2Dxr5zBxqbCCz0yS0N
         77tO8PFiZmd22R9TM0YaGOZ6A5quPPh3jn1FYKvFrYA/Gwovv9rtyKjCNwc+L3fF3WMc
         9Ytw7o5s0MxkgJZ6poCcLjX/9anFJN5aCyElQL5G56ojKLxXzt6Hb6B0oT5hSTSuoKBv
         qNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091140; x=1786695940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmACaop3NpP/tkQpdGI9o6oXEIytD3NJ1p1fSFW/3f0=;
        b=K7+6nDko/zsm6FLLmPtPDGZZthpXEoPJgqpYFzKPPK+JZG5MWktiSIZpPI09zJC2VT
         zS2TGyBhDAS4DgcWlZGq7DaQvoaXGNF7mWrB+IB00LxyI/eNMChO0tizbAqmIJd076FX
         cVfmPyauRR8e5UUMfpmbx4XYnp0bnZuBhxJAwad35T/OJxfomduwNm5gQ0hLXmNkdug2
         Kzq1yZ5Xvn/OGJe7M0uZgwLCxs+PJoAEczt3Mdw8VunOUlY8O1bGxqxicxx0N4CJ5AMw
         UC20oLgKYifVA/wKN7+rMZvcnlzyg7MkmqCffZwwffh936uNtTA8blJNFspEO5QxkQx8
         IUOw==
X-Forwarded-Encrypted: i=1; AHgh+Rpj2+32fqtFOM+rEOgwaI0WBOTZJOktApC2uL7JAa7BoYjV/WTpVTUZroicl6e+zYM4RInpWWSmWoGK6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQYPX1kx1VheqM1oTAP95D1reycEsFYtPF1j5wWlyhAYSjcx3
	dw9VVnIgFs4KgMWdCWJDeg6N/w5tKyFG7PTfd9h9YNbOw5TF0I1uM0ilzNl4c59Q18WpCIW7YQp
	x09GunEhGxh3rKrS858LkHbwfrAe2uvGdVeWeEVQyW3FglbvV8HDb2xHtD1SJDsZV7w==
X-Gm-Gg: AR+sD13gGwNXbKR+hePkZohaBOZ8HN86vcg2mwGZ3hMKlxO03czOdHf0+1AMaZgu7Ei
	KC0REAgRQcGxLdbbvif9IIQDcMbzcfmeFrHVdFwIOow/2QOhy+c9mwU4lIXrwJhRRK4+hibYQ9Y
	ssJxOoe8bWY+unhGbn8yx92HWj8UqGUdtKVATt6fQd7B8M5Grk/Ej2MCOP/oG4RxEO1wcCrPjhg
	VMdQtMSymhfMaNMHw1ExaLWsRbKqm+Bia/bpcjpLAkFFoyxjAZ7GTWaBZtrxwHTCthAdbVDnBJO
	TqeZEhoL2E+dBL3rhrJnfQ7bEnjVTUOZfFRXQkEVNUOz+jPM0D34p2CKBAI6s7uEI9gZAOtADM4
	scp3X4yuUvhGxtv3jHsnvY4p8E4DY9ATMBeo=
X-Received: by 2002:a17:90b:3848:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39261fb9e0fmr1999611a91.5.1786091139595;
        Fri, 07 Aug 2026 01:25:39 -0700 (PDT)
X-Received: by 2002:a17:90b:3848:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39261fb9e0fmr1999560a91.5.1786091139140;
        Fri, 07 Aug 2026 01:25:39 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:25:38 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:45 +0530
Subject: [PATCH 01/22] dt-bindings: media: qcom,venus-common: Allow IOVA
 reservation memory-region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-1-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1455;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=BwrkrLsH1U6pF8sgcZ6o579AfE/d71IHNQRMfwrAtyA=;
 b=K4ivvscxw1dSJI1lnnbMBTcF/kp5bHd9GyCFzpy74rrzNyx6l+2KelLNUh1BkexlSwHWxEY5o
 DSq4wQ+Yn7XCzLJdnvaPlTBOdyiGa0LrmvSrf6EegOYAfPJKQhfCKyc
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a759684 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OD5a0iPE9_tbS_7HGJYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Cf3v4oJUefVnouWY2k-PY1J-bX8RTk7J
X-Proofpoint-GUID: Cf3v4oJUefVnouWY2k-PY1J-bX8RTk7J
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfX4eHxMBOm+vxu
 qUp67pQIqOB0qZWEGs8E9xTvG0ux9XB2k4JLA3rj962IAPcDvEHJrwd+tB6ZarNGOUD7EZZJ0Pr
 8kGhK8SoSrZXGQp3IB8bMbK7WlLhOMA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfX4/G+/bmYEe3w
 swsTR2fJDQG/CRQi+IVm14YTSe96xJEVet2Nh+cTvyUDCdP9MAGxJZ9EtGePg5wyM2sKIHpBhRZ
 dsa8QkIbXb1/N+Nb7oCJb3OX1gL/y43iJ2zcFMJjSmVeTE+8a6oJcBPntEWeQjCDGku74qPcTZB
 aatwpUNy618rDrX5eaUaJjyFuTGBr3xyui0odvJ6MxeIgwc5B/ftHBmpzRoB+b9aKGWgGO9kN33
 OEU0NuDwxjDRJbKY9CUZiEmCnD/B2QpMdtwlD8gxT5UaPf5D/m1q5v7+W+nr4FFsvsRkC/O8qPV
 O36iHHSEgmM320A5cPf9cOG72Qd/1kx5svt6exq5mxlykuqebDeEjFL82JvVnKLlEWhoSv/ILsW
 NhaCbI/V6KjGsTqmJo3K9/Jb3pNxBoNl5fqiv1FFmTVT3maGIaAkCcn6ljHbWXgxUS1CdYEAAjO
 ltyAPp4NIHa+0NjdgWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070061

Non-pixel stream IDs should not allocate IOVA space from the 0 to 600MB
restricted region, as this region is reserved exclusively for secure
non-pixel.

In addition to the firmware-loaded codec carveout, platforms need to
declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from restricted IOVA range.

Permit a second memory-region phandle for this purpose, and describe the
meaning of each entry so the ordering is unambiguous.

Fixes: f8cc21d454c5 ("media: dt-bindings: qcom,venus: split common properties")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,venus-common.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2196ab1e4588eb396012ba6860712..0be2f9119e78233928d23af86836ac294aa769ee 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -37,7 +37,10 @@ properties:
     maxItems: 20
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
 
   power-domains:
     minItems: 1

-- 
2.34.1

