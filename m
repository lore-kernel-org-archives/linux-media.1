Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766E353A885
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179253; cv=none; b=ohXCYfNOb1MYeT0uQczvIYyDY8pF7XOOk0Hc2PZmKMeAB2e8sSBvTT8fHGQ8SIjY1OTu7XeMn5QwYYXiTUzmfi9u6onjxRJR7Xe/KJqtwLcbf0DsKNDfYuQyZ514liDqvfZKMX9kSyXMdqvNWFqDBqNB0AFZXQx1Gr/hjTiOmlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179253; c=relaxed/simple;
	bh=KacuOzfLT7ghT0l8x9+HoH6R9vGKNBZqubpcPoF6wZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1q61FjYZ7rPUHT/Muq9g77Vvpaomeaa+lC8wBa35CTQ8aiWGQHeNFtrKVmadm2Q4tmapZ6Hsr7o77BaKrww6MzoADbInVxvRuF2LZTJp1XeBW2OZChOdGnYjRYd3FxU0QJMXop2vRTEVc3griWxun2nj+f2Jo2e4MyovgHocpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1qo0tfr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXphIFOm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1qo0tfr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXphIFOm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbrRu2638870
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=; b=R1qo0tfriU9Zwjaw
	gf0ddGNo0y4Nm4a00WrUVnBbCT8MtC32tLFxxv0Nyz2NLBoHwZTfIvy5DseHAjiV
	FkYsD+as4SwTmIjJLIBa3ek9qsO8SlF1NrsCtXvd+jM/5Fpy8EEoU3hLv7O+pnxD
	YzvyYH6ryZYv64N87yPGAo9TXUzt+N564bxRi3jMWsaFMNC3Kc0l9GEKP9gqVol6
	Y986IM6k+V+7Svt4GwFPZbdorfCFV5n8Fi2wm0Vpj/AX/9xB+WK5nWiuJqyAYgSv
	u3M7ncKUHZqV5+URGItxYXPW4WPYhOOl8/BKwRV0/Zpc67HPGchddUu0mtrEoQHM
	3VLJwQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqjggm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:00:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78350646d7eso2272201137.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790179245; x=1790784045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
        b=BXphIFOmDLdQRY7ExIz0G16Bu+rNeFpOEt8Ka756CIRWwfSL5/CRqU6v1peKfNT1ii
         uGdW3+m7+PSeSrcu5OKq4W+wIDAgPq/MbckZu0W4zr1yPqN70wGMYVsZQsiHrJsePZvG
         TXKj36rl8JxdSHn+JgNHLh7/8PmpQviMj4NvS1+aNATquxMVlSVmYwhA+2iA2wS2JNYY
         ZdcFUPPM1j4EXZA7hY4CvNBzv1qzZ72fZFCXlobHA433HBjD/0eOvzaGK6KLEeBmApiN
         r1HPpR49ll0ZTyt77sfKTDPQRd3JeF+uyDRXR+sf98lLsnpRcHczx+bQ9J0yer8AqmXf
         GwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179245; x=1790784045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=posbByi2C22vAqDX2ezu/Vx97adQ0JmvEhOqcNgZPY0=;
        b=wIoa36CBPyX4yj/cGe0Rh94U2W3VGT2vo8I8ip8CDyE6dUARE8cu+mQm9yeI/XSTB+
         5BBVPok375oFnyWSTo/jWasO0q5apUXBlBsi1dotElGb4PNkAU3FgB30xl9XLiWUGE0C
         dJKpGAkuCCFB1c+POGhP/Ks3CKvLXN04HCDSq/wYyssYTJKM+5ccugYRdKZ5O67Bqszj
         Ob9Q79FBQuzPFADEKffxbNG/TiQM6vu/rxwaCmFl0cPg1EuXVTfnX9Gswg7KRQcL+AS7
         kGbOU+fMoE0gFB8ZCs7hzDTtNfvIQwUMfIQlo8bQnb8YEMdMx97JHYv3gUupj0lhT/M5
         w58Q==
X-Gm-Message-State: AFuF++mXL1ko1Pz0MxQuHLE6tAPU6A70T4Qbb2won1HadfzWo1EnkoaK
	eoVOM1NcpKbe/oa3srOKqU8Xskb44WZxqRSWXDJbW4Yn2D52JGnkGycNdv39AhoZeAwwPspiUFW
	484F+yNESmjSyW6wzX1K0QPx8bq/ZDbkP/5u4tlpBuIhlwkwyTKPdBnKsiPZo47PgBg==
X-Gm-Gg: AYBFou1ICRwpAvdED9n5BpX3MDc7XFYCLMEM/FsJebwPeI6AMIgBWXyJiJEt/GEEPKh
	PZNWpjZ1Ay84f6e9FGTCJEs9yXEzTemBM7MvYdkx197mcXl/oeZ6iXVqD5kVfCkGQjkxWC4owKI
	aTbIZilpScz07krD1ABqz6jA9I+W5ZEJj/je0EgHhvfk9w4pjVQboPX4UiudPP1u/WqtqB82L1L
	l0PkWLd83dXO8CnXpvKpbm/VKcxtbABTp7YmgIw3k5KjbP6QXQ4FVWV78ft+O0NoMeHB+ccGg2h
	lr9c80Z9ox6RRjmOgJfbuDHBuw/vHblP0RDWBT43jl5AYRsTKqvyyCYaw1vV4rIA58MFoomVrQN
	vZuOTLYv3fpuKG3JI2v8R/LrwH/7yPUSuT1Q9KaZxUhgfOvlb7YLiWFJMB8jyJRcazGT/YBDWJN
	ODN9AgcebpaoRqDZLTwbGPO+5aeQwl6vOMQX7ZtNqhYFVhndrcyNmyyKV4w8AKHA==
X-Received: by 2002:a67:fe0a:0:b0:7aa:fbd3:b004 with SMTP id ada2fe7eead31-7aafbd3b8a2mr3887252137.43.1790179245062;
        Wed, 23 Sep 2026 09:00:45 -0700 (PDT)
X-Received: by 2002:a67:fe0a:0:b0:7aa:fbd3:b004 with SMTP id ada2fe7eead31-7aafbd3b8a2mr3887214137.43.1790179244491;
        Wed, 23 Sep 2026 09:00:44 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm80739325e9.7.2026.09.23.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:00:43 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 18:00:29 +0200
Subject: [PATCH v9 8/9] arm64: dts: qcom: shikra: Add OPE node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-camss-isp-ope-v9-8-86a75dc18b83@oss.qualcomm.com>
References: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
In-Reply-To: <20260923-camss-isp-ope-v9-0-86a75dc18b83@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: KljhPYYfryvpTxYb-74ekheTaS4YqfrD
X-Proofpoint-ORIG-GUID: KljhPYYfryvpTxYb-74ekheTaS4YqfrD
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3f7ae cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX6zTPadAad9je
 D/AKMv8EeqnpfDj6BuMIwyvjJT8PMql5068naT0JqrfepgFvfwjXFYeX+XcfTMFDB0E4didybVY
 sDOFpLQmLz/FG/6P+Svus4E7RyYoWlc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX4Jqwnr0Z2Yqd
 e6edEvvKkH82yTPalPQVPVSV2lgSd2UxOVanHhEsxTezZktEgGfgrQuDOGQERd2nGi7urkq6hPn
 ZvuerLslBUD4GuZNHcJmOhO6XcBoM86aek/2jV+x7dcQtRP6b7O129k2zrnniCCsHRZ7oIZhluu
 3oeosfBL0KP5W3KpEMT0NCS5aA4gU0zzDc/krH1qigGl1dy9nbGijZ34yt09QovElgJSlyzWi9d
 YhSUq9EqlDE6O4smgzxawK0TmGVxgrvYGY2poj95zLlvaDmdsmJpD5OiPwAoqgCXEH8knfo98XE
 wIwW57ycm9TjJl8z4/HfxKezJZYKndt0EY0h/rJN+fvpDNsfAg/3OyPilbRyReVd7PWkyTN0nRH
 Hn0XZK/Jk4LV9XYC1ZX64jqu9zXy/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 92d22e3b6931cf49f213d1807f78fc1a261f290d..5adc28e9aa64508366e6c7fdad191a152b8cb6dc 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1828,6 +1828,83 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

