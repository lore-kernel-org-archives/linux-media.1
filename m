Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173121;
	b=2ATFNQlqRe+J9egBBvwOW9M/rn0b0gXEG8E5QFWTZWhaKXEWzLXlzGeS4urxBxhRUGj4
	 4xxmgA/9MbkskS/JH0xeTRx83qB0eAr795oTAyiX9eXx3viazf7I4CuvReArIY/4PhhSy
	 aMm5Xc1GVSvulf5WasasZXc3fo28/0SIRLSuRcEbG8CYaIQequzkXzhxJe2Y7JtdsjpPc
	 ODH4BbtKTwScKaMU8+pGIvcdjuzj3pfVNUGNbd/abYKVAKLvpFynxwt+VOPqABhe/L5KP
	 eBj+UmrmRec03ggRBjCtvOylUp2+61/6pwg0D94l2Y9l/4cU7MtvVLJfiEme+59+SQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GinH/XlQfvjPQgjvP7J6UKK2KAaihoWZf93tqcQ2sPA=;
	b=Ahd/L7UItLWVWVlDU3L1niPhJyslYs5/D3Sko5Sz68KjQfAS16krbbGb0gDCZc6QRJwe
	 HU0jwGukHnsgMjJfV2MKFR9n3sdSs01wki8QFb3wKJmRlYCU8XEtpcA27SlEFZcnFfvA9
	 pOIt19j7i42nWS/zZ1vbeB7xGw6AGPGkvq7epYrumOD8ndX51ARj67aYMuJznNv/ppzdF
	 f0MtvRAXGbZMYAQJkt4b1Di8h1KikbIejbgBm3nJE4Xb0dpGRneRv3OTqooHizQGYmhJk
	 xW47w2p5dKet/rqcSC0z8ctSKD4k//SHGk3L8oIWPL0krPANAEBSGJ3SAXVOY1Horaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRNz8WhW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8XCno87;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8F860A6F4A
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E8F860A6F4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SRNz8WhW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8XCno87
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoL71462889
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GinH/XlQfvjPQgjvP7J6UKK2KAaihoWZf93tqcQ2sPA=; b=SRNz8WhWsS1UYZAG
	y/TLwZO41pdpX9/NNV62+XhOU21XXPoXrXBC+duejj7wSEvvu9bOpmI1q71VaI4b
	qVz0ezbCDHtNowBjbhP5Uex2YF4tNqO7em69/1ma147c4taBhyXrxT48hivLh/Hw
	Vsp7YnjfcN+DThNea1KUTqZhW6cINwGYgVWm9JBXJBkc0j7h+QhUz5wELixJskWM
	cEb064wRp/nSCEiR3FrYbTwCFjiw7rfEhLXtKINUc8UrTByiC8PqEp3oHO8Fkgk/
	KJdexvcmSGAYM+tfX3WNXGJRSpCTZ+aUnKd/hC9J/RRlZHSSwYgO6PYPmekwtZr/
	aoxjGg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah6e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:11:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3846d5f54c1so955895eec.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 03:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173116; x=1795777916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GinH/XlQfvjPQgjvP7J6UKK2KAaihoWZf93tqcQ2sPA=;
        b=W8XCno87Sr+e51euSxDlOemmeaOJTKE8IX+q47BRU8B8eg9odvbNDaY3fuJGiZ9PI1
         N0FFToUpv0DXQ5F3Y/g3V/k6wsjHF/eGnrnKRQTzW1PwT2xdtW86iov7ANJfAKih/nUN
         AG1mbmI2xA2f/8H57L/q5lZPlPGWJkL9STQQ6QlK2Hy3+L9/Adm+x/TeP2jJroC8GH5c
         pB9GTF9PMdBMkTIQnOu6FBbK6D7ViHzW2mFUFOOxs+6eE218NkyPRa8eQH2bZBAa3Sqn
         6eWc6KLW5bculKdL4AvTO8slHlFZTBsdZvLrn/I0/GbrhlAJIzV0guJuP4QcBQr2Zipz
         TEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173116; x=1795777916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GinH/XlQfvjPQgjvP7J6UKK2KAaihoWZf93tqcQ2sPA=;
        b=Y5sht/sEeYRt4gkoBy+2SWJTjBr905/NGzQ5amrLsXecrZtAafIwatlVtWVTwXLd18
         b8GTwuWDeLwgHmaZe88SuzppbHkB9YpRi1EIwlPVu9yGWXDCu8k7PSSjrHiNXD4iOzmc
         NkmoiJtoMR3IM6j/fgGVMFiyhfgXRr5g3yVIBxuOfbG3cubjtL58tagVJ1+9m3eQH+aY
         JOd+8Q9K9pjL4quOtn4Ocy5lznlgoa4DbfH+q0IORs3qqPNuU5aZ+jrF8puLziWFMpTu
         0ScZnaDYk9edBM0Z/LqvOr/My79zx5/ul6aVkpf1eyAHEQ6sUU5Je4mqsW4mOcbXQnyo
         tJ8g==
X-Gm-Message-State: APuU4Z9gfa5BFtjLpNLQoaxB+YMIziifZf/Co7ZF/I2p3mVFQxKp6Bsd
	j7sJNWaTgKlhVeb1magEqx5RYBAU8r/Jvd5I6vwF3qgXxf8cw8HQDIFQLxqQ5nQmf6z5u8Bwwkw
	xYbpfAYAmDQxxp8KLewnAf/kP+ok0CG3Ob+eKEzgkekAAq5W6qpRda8FMYlfWrJiGag==
X-Gm-Gg: AYBFou0QnzIzcSGFLnxNJqa3Ewd6OCMK8XogeoIY3aIUevNkzD4X49vdlnTmxVhX+2q
	EiOdFczqeJ5uvPpyOOQ/HyP8wCv7Oz6P6sV84LRss6YjbixI2+Pd9qXaZDNzrWwrv8coaPaCyJI
	T2wwKaHa6doWp6xEQC8llsu4XfqEewO7oV5+rdY0ERPdwIlaVodxmTARA2jvMmK88X2R0UojnbN
	kTC3jUiMzvFYj2fCvhgl2C/H/ue1gc+c1jkINYvbWQRe7LOnLScVczzIIeARrhslWq9EK9VQ/pL
	nhragpy+lBogE8YtA2brQj1UjHpYb560CGdNOEiOE1AYCV7V+OvMCMJyd3n7mDFNq17cXGpaJgO
	IJ1j8BKtx9LVIDiU8QWElmGozG7vuC2RFboXSMzjRfSFwIX011Ez9zF3gLynXxikLxaehiROpa9
	B3N54ptanb
X-Received: by 2002:a05:7022:7f01:b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b5568aeb2bmr2348970c88.24.1795173116041;
        Fri, 20 Nov 2026 03:11:56 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b5568aeb2bmr2348956c88.24.1795173115508;
        Fri, 20 Nov 2026 03:11:55 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:55 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:58 +0530
Subject: [PATCH v7 08/12] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-8-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3423;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=X8tAxkzMw1wEATctH4Ad2sAV2eJmcw304ql4kPc8PM4=;
 b=5FSQzCTwujSEBgftO5XUxEyJbcYHFMcEHSw38p+chaEZRFHR9ma6c6ZEzSR2+C4VgtSTtfQOa
 Of/ktLYtV0fDLVgGWtYLXrNhRfvydl0DLt9QOxNkh7oFZoArrm2Lmu6
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX7pkbcdC2QpuT
 8boHi/niKSiYs4zUmJVlUdYzqZ7/uHuH2XVZOEs1pdX5i/oER6KMQOLaCpAEN3Pq0uhRAN6E+Fw
 hmTxNWMJke6qEAk+IdewgnrAr2fJrljH2kzF17g+Fx31Ks2a58ZxnElA4/bq36PMk06oQnRlXsI
 X5C0B20QuDzsOEQ4hPJ2gkuOsBSIs60EAQhB52rN0GUvLvZk13qw7lbWxh8IL852oh4UI/QmTHl
 r+9PfIS6m7okde9Bt38MqWtWAVGTTfRaIREPP/8ye8UvSFBjQ66IiEmUh5CnCXzNmE/kpXx2cN1
 H+dNP0MYrwsJz0mTDC2PAGPtOqstswyZ8uymX055wSGQkZY17mAGU54R0EkECVbU3kdww9hyshj
 6pv6wx+xfGygoO+q82jzp+J0mO52QCN7nmd4HH/IUaqjrMlCTRWU5yS8cUiqWRD0EFT/Xrs9FyM
 7uIU9D1R7Y96AhmSBKQ==
X-Proofpoint-ORIG-GUID: rMJ0GbNwuXGbhfjJY9cmq7ogyaPN66Tz
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002afc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: rMJ0GbNwuXGbhfjJY9cmq7ogyaPN66Tz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX43A2cUA1oEpJ
 ReemL32AdICYU9uKKQUesaooG+m/tEreSKVTH+9+I0EmaKfyNPpa9VVm/VXCmtvrBq2wITK/BEo
 gGu15kvh6l+jnkmuBhCSAfsOUO11Foc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index cf7d67faef92561a7e07a79e0454bb6ae13b7910..3bc4d08d69b30b729e2bc859a4d86b71e868afae 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3712,8 +3712,6 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
 			/*
@@ -3723,6 +3721,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

