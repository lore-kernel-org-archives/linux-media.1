Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173124;
	b=IlD68Mgum8cMhoiBhS4QC/JyZqnTzWvyK7LSx02UFFkWN78msGXgqpiRD1e0LiY06lWA
	 ZbZ7ETJlqS9RXMTXp+sq/25AOAAAwMJTtSxYiBJfNPEikHDgD6YmpDFf6+BMtKvswmZqt
	 dlj56yKcl3zm3LFMHxIojJD5ymIF3N3Ol3D8A0RpnFkYxqajZTZWHZ3YcFpoiEhxbnbFO
	 SAvIaaweKFxxycj9Ix97k0OlN3qaJviY0FZb1wBoGdZm9CEaSwt5w7Acq5gumQLRqxjpj
	 sMiwKKtGX0NXBHTOFCyGUpd3nc5qS7J0PfTb+JAAtqRcxif9YGPwP97pdoa2svvYFSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=;
	b=v6HbgLbvk799eH6ECk0anGo0p22HnpRGQvQgXwB5qIrrAykHT3xKqtFGNGCuZE/qgdOZ
	 gbUfEAuX8AJaE5zLpNGKWtFtKwjtIV2c3qF15YqK21St/JV8ytE4UbPfd6J0m+M3YE3P3
	 KzGgTVQhzpoRTkLhYFfJB0XpS0pvk+buES77GlFBKVwd0gGvKRDoZFVoUxNfEHNS550eW
	 X2jNpdkzI1/wvgtVoo3gNps/P0qYwsy0P5WLHzOALci7x9J7MpBW/9qceqlEcMj+8RHhl
	 dLw4pbhWHAbkqMwan7XopesMBCCoIPLYBan0fPII0k4iEhyB8sbkolXCoSTZ3bM0+Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hG8h5jf7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLt3ak1F;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC9660A2638
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EC9660A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hG8h5jf7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fLt3ak1F
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqev1681893
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=; b=hG8h5jf7wZlF/Rcc
	CDBwFO+PgpNGqKlBcHeYh28kDAO2x1JlT4ISO4G15PL/05NIPgqsr3az7CBHB8zH
	ljGzAj54E8s/9U4uR7NCyVWfOIt24EdMNgCb/yFTJkAZ13WHI1UvhRKbFc/40GWA
	5NVP04SaZSg7dZ21FFFyFHDyhm/tX7wHzG39OtnF8PAKOrL5a+8oDcr9tSgqK7BO
	DU3NFPwxKmgLrW2jIrVy31CGu5UEiMIZz4skrYVFqmWxCw6zWdhZJ4+pJZIi6fK+
	OUuMZsguYkfXx4Tvfvku/AA8u3/o1StBeupLivRvjTYUDoW4UcQnr/UIvZSLR5bn
	oH2S0Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t4j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:12:03 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so2158862c88.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 03:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173122; x=1795777922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=;
        b=fLt3ak1Flz3yMsy2R7f3RuB8SKmvp5YqVeon8wsQZnhdQRZ9azwWhW63O7crkpR3Su
         acwHtW+cdzu+vzimIbqFu5Rjr1xLpagseTs4kqKfLOr8TQyrB3bvYYJvEconk81ug4Vg
         5YGWm17HSMrR/pRxBUdf/joI+8IF9TX2NdL0tI0rg702I6MhmKM3LTKYz8oCwQJvF+Iw
         NxJVBACYnIQTKSAhrcnvO9artMpsBVmkEDLGzZOSy6CPqtaIgAhulAQZTQdtVfPyEnCP
         /8Tju1aHaDlNQWpy2qNToLSKSkeHu1RRBTSPCvieJtp6fzP/jp3M38GMV1by+4u+XBqS
         e71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173122; x=1795777922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=;
        b=0Bo208PQoaXOwgRnjgmwK5rj1GrX8jzYJ59iXxxWtwgldXyr2CEP9nKncbQPl7Fphk
         77m5Atn/3+ExuwXKZNrJ9oZyYsAw3QGj6d3B5efj5uOCN35KzdRHZjIp7r7Hv76nUXp3
         MRBooFq2I4VRVOrz9dadeMHChgi/dxTQcQ2p4ZO0d74c0pn52pXj9OLt7RRUr1PqlL2R
         C34WU24B2zof6nWF9oK8Ak0yMJ4y/+rbREZxVG7Ryt3cl8Le/hv9aFkITlS/rrzEBodr
         ZPmfVCSzRMzdvcGTvQH814MvN1wOMUT5fCWlVd3XiyiUysZpGpkVBB75vOlPdHsv3G6I
         Xkyw==
X-Gm-Message-State: APuU4Z8ssJKzpt+NXfRltMFjmHQkr21K6bDZIt/BN7Cq6Ccrk8X8j9+c
	oQ4sVrk5NVotKgQZzkTBFyai+VO8zhc4PqS+35d2Z3IyXGV8LE9fFHHDZojbVpmfkil3PWkI+dJ
	d14CUkLON8rD6+0Qe21Bg1gJXEKTGJGe9LMkDfJVlOO+eSOQ6Q+lawGnVHrmNEHGBbw==
X-Gm-Gg: AYBFou2ASl5zVvJKbgRwB0y+xzTRJM5wI0fuLjNRdL96G9rvUW1OkALQ67CYw8ZUuUc
	HQR8GFR8yHWjG8mwcFo38nPWNgmiXDYOgDlMqC9329nXtqvmY8nDePRD7Mdci1tF8EjQBg0O4ay
	rfmw+zJxNnahw4lbYx8+awbn5+Tvh4t+3m0Jr6/cz5vaTHs02kYK2e0GZEBzttYnrqs6QIr+nnv
	qGdO3lzfARHBAYHwVOErMjrV+smoVtg0V6//pPMIg56Yhy/pTGUSrVJXT5GRLulnEJbZbgv7t0f
	B/YRqf0wFhc02Rj4RvBkRxr1DtwEapSPlYjUUEfnWJQUvYy9XxJHijzMKdbHOX/4drM8qZuHXk5
	DNTTdJrpAh7xb3usuR9/0J+hCaOyeimZJGw6+0wkSxiXaHXK3RqSC9s6CUrUNsUBk89UlfxCDUa
	HtH8eMx/wp
X-Received: by 2002:a05:701b:2313:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b5568b4960mr2485771c88.14.1795173122186;
        Fri, 20 Nov 2026 03:12:02 -0800 (PST)
X-Received: by 2002:a05:701b:2313:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b5568b4960mr2485735c88.14.1795173121667;
        Fri, 20 Nov 2026 03:12:01 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:01 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:59 +0530
Subject: [PATCH v7 09/12] arm64: dts: qcom: lemans: Add Iris context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-9-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3241;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=56nqMJ7UtioVIbaYHGKCWesxnXtWYsw/x1i531cBKTU=;
 b=lRvZJjsmKhcuLMAi7DZJOHQ+WUurx0XOetzcQkrDSzXR3Jz0RD6hSGPXGG5ocIdAkXwyFb5Re
 dLX364Jpk7MD8HxJZeVFqQykfy/FvTMdT+DdOoDSXTEdjP8W0m4IhC4
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b002b03 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: EwlDFdhcjsV3a80Y2aUACrRDwpZJpxvP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXw17hgnJUl74p
 KrVv8mXCrTAu2J1IGTyMK7iBbUahDvE3ewUnTbfklHgkbEFPT+NrnD1SXzqpi67wWysImh5cXxe
 WSV3BESu4NhmsgBin4+K4jNVtyIqQntR2R0Ltkhz7UuPyc5AMocIBOqEARVRIS0o9NPWWexFpml
 /a6wf/nh1ix052IafkA/tZMxjeq6Jatim4/HaC81ha/Y8X4JuW544xHCKsF8SGGojnWeFmHx23V
 pFQlUfeWQVWWEqEyaf+p5rlDwSA7EaFI2Z5rpptImpcrnle4DIXJ0DaM1nZyQluchYUvG+YGytD
 WpWY/SjIUuF5IeSPyh5TDbmTjLqzL6BJeWMaKlE7H1rrIPSLqJbr83EIeP6CyvRFKfGg39VGqcQ
 fIt0hB8yK1uqf9vaYCcios1EM549gZUO4KW/UGTE8Pd71BPfqpvdv/sXu+7eugJX72q1vpZH/nw
 ls9UKpyQnQBxRoFsMsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX89IRaIXoch6f
 bh1EQf/ai47t7Afzh0St3f/EKz17AqusNVKP2RxD2Xvoojm+xEqs6NuQ0hxLLQZ8TJo8G1z8mNa
 eFmUKokrHUVIsWKUMXxcwX0MfrDmXHo=
X-Proofpoint-ORIG-GUID: EwlDFdhcjsV3a80Y2aUACrRDwpZJpxvP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

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
 arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc4519d10f3f0765d0d6a54aac19b3..26f5b292f4b7525dbc365800ce8aaefe0ce174e5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3241,11 +3241,22 @@ iris: video-codec@aa00000 {
 
 			memory-region = <&pil_video_mem>;
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
 		};
 
 		cci0: cci@ac13000 {

-- 
2.34.1

