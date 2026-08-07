Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2348D46D0B9
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091218; cv=none; b=U0RzayWopX6N7TYSNzu59Ro4SWZYKBP3Cc4BguZBfR67v1u4A2mFHIJcwUAdVqwbJp2CUynzQnsV8D8EM9IoG0XlivN56o7Nj7rQ6HoQPFU0BkcbA6fJMitHnioR3RGUSf2FXU7lK5Pi+Edgi6HysVL/FxHPz/kYMd0AovHtfl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091218; c=relaxed/simple;
	bh=RUJJjQBrrcmOIMJRWgb3GGaWcd7QRAQLbdW6SGpk2NY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvkdpUzEU8MZH82/GRPGRcpI3VD6LGI9XVHdQoohsfB4/7xAmy5eL+g9GVL0lBgGEMvA3Hca6YZBa5TzAzH4HrddBgxHrDsH4df6UCRxYn5IqtZh3OU4WKgMHGnr31nxLhMc9NfFfgVnJYqNk60hLb9KU7lsJcuZP3CjiI87CPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSoe82Ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Blb7eH+s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSoe82Ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Blb7eH+s"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777x90x3218070
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 08:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcph1uyEXbBK81UQqq7ppFED8fJ0GoK6EhhgAUqQ7vU=; b=lSoe82HaD93ycRmp
	jSZqfIptQvaZSviCon0DPRODRDBisyj3Vm3K+tAb4PrcupTWlcU2ebQFsX/FGeAQ
	8qAofsjHhLL6jZZjMOp8mfc43beIHeoW8XoNwiZnupnmV4Uqq7whpvqJpQD+s/NR
	50kES3c3hm3rKgS09O/Mzqz4JvUx4i8JATXkU1K3R16dlEbz9HbzIMs9h2oGEkxd
	UcKuCMCAPCyT3Fx0PN0uSfy+Ity8wjQJ2phcmQa9/cHnaJ7FRWlNVs7yDR6PAXIy
	dDthHEE09Im2LBCE4FwyrbEXXY5oiFagbsZrNyIkp+xvvNQkHqsAKYFQwIIFW2+M
	LqhMqA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hty80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 08:26:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85798977dcso4617700a12.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091216; x=1786696016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcph1uyEXbBK81UQqq7ppFED8fJ0GoK6EhhgAUqQ7vU=;
        b=Blb7eH+s6kre+4d43N0Fr/lGE5ot5vXpa/HnsRqtwuq64B3A26coP13JWg4EhcfIMc
         g32m66vtbQVSKf7DmRS0swOt3cH7EmLKI8Fqb0kqOwIRGkNEcKOdEjQt8NxEqx0f+i7Y
         I9gLCrJUj8QBLlyauzo58/0BYHD2HM02wQMA8s9IoaQeqEGNOD3DnTyUYQcFKXZEm31c
         IRHt8YvDXhuTbbeOfmbIdy/QtBnNd4Ns+L7lAlJeTvz3i0srbsgQpJz1aLSGBJjCyfOM
         3VbflRcEU4brJSNbD7fAzUP/9hoJ+gpLuMYeyaZI56SQhbfDl0OO+lcjSmk6NLU5iftM
         Mn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091216; x=1786696016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcph1uyEXbBK81UQqq7ppFED8fJ0GoK6EhhgAUqQ7vU=;
        b=Fab0qzxwL4+S0ZCe4B33gDRFFG7jHFt0Laj7vxZ4Eea5X2+cB+oMqYxPH8urMqcktk
         gigCP/QpTquQu9mTYNePNYC1CTdzMRzxknPcutMP5nwnu1mGOC6CX+zTY6+kaxQMOfti
         /b2AEAx7r+pzCRt9MO8qb2jkK/e0xMuwLFzk+xYwZuuGqtYQK8QMl36cWVdgSGzJT6hE
         RVkhuztvbqdqLkJtxPtlW8jEew2w00HmYwg2TMhq1HRABsJJKujyOQ3bgvr6vMZUDdwa
         9iUD8Y97/COwDTCH9olLl23vEvj8wnPyqLZ57Sq0YkaXr3qfiOC1aaKzNASsQBEnAT8J
         HZ0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpkIqjJW+DRypAOX4JMUSoybbGjGF+P60/YdJasWCjahR2fMHNMtkSgCg7Z32zzPedq+L6CncFTNtFgsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEX0YsC68ixjtFaZhF13LY9QXE/WM9WdJROfX8E10oXoQzGEsU
	HpiZkITa8Pf2cgAn28TuiXfPhPHzC7KebbpVLAqxkthAHPbT01C6YR499gHxJJMNOAeDIkhS32W
	X1kW93zc3+Q5Cc1CNhvt//g4/V9OBFEZO0dGEI801rMy+f6p8ZzlnnYRANg0V/7qAcQ==
X-Gm-Gg: AR+sD12pQpXSMgjvJmXYLIBHFJQzOsIOUAIib8QqQbYW1tYSckcxOxaYEXTH9r2WiM4
	rnI2fro2qBh3nt3utu3EjaENAysNwSfJSRXopl5JgOIwP/2T9ZnoPwHCvvFpA6HGu1r3hPLdUFu
	q8NEZcHRk/k3Ky/4Z1XnyM4moxt5gkwx1tHed0ptVLscHP4+Y0iDP2NvK98wJT7POaxeA8ff1fa
	mISaUcKQxo6gmREP1BSKIpssDqY8hGYf2ExftQF3v4tCq+IE2j4Df7GFbj5u2RqP0BCgGYffUbh
	cfYHfil8miIAsO4EGWvKQm5oY1fyDxUzjG4yoBhdVLiMAD7bCbCCwWLHF3aM0sZDeXeCZJSev7R
	xGzTda4dZWGDCEPxNTdu/HUXBjwNjF7QXczg=
X-Received: by 2002:a17:90a:d644:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-3903c582511mr21905451a91.12.1786091215598;
        Fri, 07 Aug 2026 01:26:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d644:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-3903c582511mr21905425a91.12.1786091215179;
        Fri, 07 Aug 2026 01:26:55 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:26:54 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:51 +0530
Subject: [PATCH 07/22] arm64: dts: qcom: sc8280xp: Reserve low IOVA range
 for Iris
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-7-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1905;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=RUJJjQBrrcmOIMJRWgb3GGaWcd7QRAQLbdW6SGpk2NY=;
 b=jT7fpDMxPQmhAEB1r48JCbu5da0Ay3ZhKOdpZCYvdXzQIogTSsvTBTS3Q++MpalDT+iPX3At/
 SlOjPDlum3NCW788nIknlHygUF/WzZJ4N4l2jXaFYuh3S5s6rrFxlQj
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX2yJ2KAfYJ2rn
 4+s2eTzG9hA5X3iPPkKmsfDz3yFhFL0RiykZBl/SQJvyg2iaU+D9KHgrs6XdycFJSFLN6Hxsq/N
 QDy6dLY0e5k8XvL9G4VIo2hKD87LQAc=
X-Authority-Analysis: v=2.4 cv=PK0/P/qC c=1 sm=1 tr=0 ts=6a7596d0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX5PXQthCv/hWH
 S+aOtbmVAZ+lvWKf8h0AAw6zoOsWh5qdVZ6y84IeXHRjP6WGr309uQsJSk3lEOs6csGJyvXm9ry
 Zq0lhhvzuyF2i+5vv76j3TIaJmHs2wXs0OBjXnjCU0zfC3OHkKEC2FMXX97fl2K4lVsY59/q+bV
 yV/r7+eGM3CJeUjwXTDtgP/xLSHzfpOTj4VmgDOKcrc9iINvK80/gKNsCl2F7ql7kIB6UFTLyfA
 FTTPw2QMBcvTE4a6u2DJ0S4KSBryRk3Dnvc6iMjHRzEDbbqg5jjMsMNhnuAcLjkSBYxXzOdi5VX
 C8okrpMOsBg8zAjOdzpHaab/D709Yx12fLQa78ci7bP1EqbQFrYIHL3mKQET6hoRNrJQ9tjW7Zf
 yr5OSEqEpX+QwVQmk/ZAteSpEIbkji9BdrkxiCDmAXnGTqmlH1keg7Cdr7K6lmUmvFiuQha4uvZ
 ifDZGmW1wGTN75UamYQ==
X-Proofpoint-GUID: suSSt17hGQkrSFjlTJCSMUqtgTB08_oh
X-Proofpoint-ORIG-GUID: suSSt17hGQkrSFjlTJCSMUqtgTB08_oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 3a52eef16b97 ("arm64: dts: qcom: sc8280xp: Add Iris core")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb4e465a71e60a2e295f9a4b3c668f..1c624683d003361773b5cd1e95424990e8130b9f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -669,6 +669,17 @@ reserved-region@aeb00000 {
 			reg = <0 0xaeb00000 0 0x16600000>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -4266,7 +4277,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 
 			operating-points-v2 = <&iris_opp_table>;
 			iommus = <&apps_smmu 0x2a00 0x400>;
-			memory-region = <&pil_video_mem>;
+			memory-region = <&pil_video_mem>, <&iris_iova>;
 
 			status = "disabled";
 

-- 
2.34.1

