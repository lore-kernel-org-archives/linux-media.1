Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953552;
	b=K9zWKFOXFCmHCkHLbYV85c2T1ZogLgj/MszDbevGCpI1g18EKgITwwe70Hoar6ExiJKB
	 aqOY9VAhLDrXAFBqWxMK9c+5sNYbCWpdTVEXDvylkdczLHC/L2U2TA/RTraZPbaoKFoOQ
	 Wt9IFDnMAm/YEaqi/NzEi0ldk/oqh+uTHr6oxhv+ERtQQTEkrDSHO8/mIW0twBtQ8pUrC
	 ecrt4xc3ZRh8V0wWx1v1dVh/TX4Yr6wNiisTqqQy8DclsYd7+aLjxGjqR30M1AJoNS8Dx
	 hcYxZgdz352wu4zTLboObNLOtdWDQo5WCwdIXaC/nYHaqOMd+1bq2Aq2IJn2vZtmfTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uDpQkXtjRd+YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=;
	b=GNik2zyCU2Rj3q2Z0hBZfxZ3VrgScvolaoWe5+KuEhY5qtX0RtzIZIVLo1BsxdchnKgK
	 p0t+pAO7Z1FM9meIZHV7zBO+l8wgiaQRtinA/cB3XVz/pDHoDK44RkBrwwovMMNAaCiEu
	 G8qzJMzCL+ZfS3PipTsuYdr0ymya8USYvSBqEHt0n6hh7yyPfSA+OwCKNmrVXK1Eiudi1
	 2JI29UZc5PAIZpQ4Pat8MbTiBZrYZUO/L6FbTDNDeb8+eEOFwhEJq1hWq0X9PgrYmgSjW
	 PsZkOHODxX3uN5SByToEkDXz2UcXK+qiPyflOLOrRfZfeAVO4BrZMcJ13P/fcOqdk6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cx8CPTlA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKChNoW3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76276606D80C
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 08:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76276606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cx8CPTlA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKChNoW3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RVDV2194644
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 08:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uDpQkXtjRd+
	YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=; b=cx8CPTlAqC+vM0l/uY805tndufC
	7Am+LQmUIpCOG26X8gi2y8O3Ui52v4ZluzLHh6SoDUZfHUyEZUfn4AIFWC6DxwF6
	gev/nq32AmRH/35JHx7cgsxj3PneJu4Dl8Vv5GFszBgWvJA3s74xKxQnCx6sOBBi
	k5ATO/6ZIs84EcT8vlb9bHsKkd8TQKWRqN40vhWVcBpQSwQCE87qN2sZSbggIXdH
	a9lha3tU+n2eElDYERBnLLSoypW5vD5qPLwSAxokkRTkpiH5qrpqRn3mw26qydEB
	py2B3yFdzEy1m2Rwtw3QWFz5d4CQbWjShe7CmKPjwCfHF/AH8xgAYq5zlUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa9tqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 08:25:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so84191985a.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 00:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953538; x=1794558338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDpQkXtjRd+YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=;
        b=gKChNoW3sP9Xwp8EpcV6u1LavTJkIC495j1wUelu/uqQ4e2eABkod1jc++VMExr44c
         /hZh2GORJY19KhH57DaFJHgQk24CiMIxhLAIKoSEEWkZJb/bjBRneeArce2kRlYWshy5
         /AmHgNWAtU7V6C1RgpuZMFQtpq9XSZoOLfG89dx5SWvXiQpE6GdsuLySmDBaYBlPWzrO
         ADGbh29oZduK0Yz8XQZajIi1vcgqWOL3W6F6qxZSx9dV78siAFRy77pR6SkQCzGFvPLg
         pVxRlmzfvhTvswlWQODh6yCILNVqH5SxS2gCDGkOL6olySOac3i4lWO4SSV3zI7wHfkv
         o7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953538; x=1794558338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDpQkXtjRd+YyxjvJI6u+sQZ6QgWckPPm+f5ZddDO8E=;
        b=xPZsEpZ0harqm0kQYEmXTctmKT9HKA4jllppS11hJxKgbDk/xXvr4aVAIYpsNUbUmr
         xUPz+UX/+7KtrR0QS+WxOKGfyT3R+pVfyFmmKoH8R+5Kj5RL7Znvyo4feykMePLeOJVO
         J2x3To8CiMgr2Msl+GjghGV+KCJThHKpBiUOIkD7bDSxHi4XuzFmdd480aZKph/vlvzp
         AWODwzoVl6oXVcUasDYmtG/CFColYh0qrQLPO42ddvZ9eXWVb0LZhctAPdOizm3IoO7j
         4mohVbjmzCGnLuP6hfeEEKOLH2b+2VoxTIjiAPllryQjLDGKf9FhnWSx3ADVJw1/titW
         0ByQ==
X-Gm-Message-State: APuU4Z9+DKk4CxbdI/zv6DjPe9imLFSzSO4+m/NXgcjcttJ3YZKNGwjG
	bXboLHI8NHlyYQ3idYUomWQf6zWnaj61c9p39K36ZFFP2h0K0uOc6FhFRUdiBF9VuHTzMRuo+dS
	IxR9fVzGWGc0HT+gYg62K03AfZdSccMiDWVvd7fF1KhfnF2JtwZDVQUqUUDkruJYl8/2uEeW1t5
	nu
X-Gm-Gg: AYBFou2xO7ED2cyfBClYslIfIuiIwSesfwpTgwtNtDa+51jJ12qynGrv+WapHfVb8EB
	mymSVEjTtVE/EboeWIDu9rHZI9vsl0le5u4B+i1ecjZ47CY71yb2FyEOLHW74UJF25/sbsxQIHP
	Ohi/A67Y8KIxn7Ol+qhSB9jiQLOpaonUmxytz61LwQvyzqQus/VNt4zAP4fQx4GFz74Y5iS/TXX
	MZMM/6KJ3vglyyyBp6OMb+tMly6uSMii/jX5Z2+Em09kE8UAZiR2Ma0MVsmrIgl6nhE93MezTvR
	J2b+jFjR6pC9AqYbV5UhT3N6/3WcqTgtNgYv2SIO1g/hX6Au6y8tFd3/fCDw3O7Hb4t6da+DNpE
	MRSoWibM/8K/ujAEriSVKIxXqWokI4an05kLnnUVrLlTQONWy9cVHUJsW7wYE7vQSa7HxElCNcw
	==
X-Received: by 2002:a05:620a:2701:b0:93f:2aa8:c555 with SMTP id af79cd13be357-945f35ba1a3mr242600685a.57.1793953537713;
        Fri, 06 Nov 2026 00:25:37 -0800 (PST)
X-Received: by 2002:a05:620a:2701:b0:93f:2aa8:c555 with SMTP id af79cd13be357-945f35ba1a3mr242598085a.57.1793953537221;
        Fri, 06 Nov 2026 00:25:37 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:36 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 5/8] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Fri,  6 Nov 2026 10:25:19 +0200
Message-Id: <20261106082522.1448390-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WeccpsI6NdTCOtHtkeZe8tnYxj-6nnSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX+IVnxiILzJgq
 8JTykr9pkyjWSvDSC3yhXfuafGJDvO4rhA6mc+nJi5D9log4oLb+Vov+aKHU8cGj8GLWHMwgC3B
 kuSD24koRtl1LPLLX6/pIWHU66WN0jr8VlOQeNxw8ZlY02Ur2v0WhKiOOVGBg9H7eVPVrygChqX
 eOSYS2U5gmt/VGoVw3NnJSaHuNk/W77UtsVEU72EBbYzKGQwEtPKB/cnN9d3+LdFjTBPWH3g25u
 mwGMyNSdOldj8t1PTcgyhZ7aODOJTfV6cy0seTrpWxI1Bb27MiRo5gqZ3EA/0k0yWBeIW+6yYB7
 u5d087IdQlzEgTcX1IFlYzVan1jPtzgrN1RBkoMMPplCdkFBaLLIWZOtzUF1RyH2XABq3aV4/5V
 81T/GJp3naLVnB8W7nJJnFUhAKaO/bw6qU1/rU6TRjbUm/UoT2RMhDHRavsne4NIuR/3ayrEVpc
 qOYxGmHTeuM6x0PfR2w==
X-Proofpoint-ORIG-GUID: WeccpsI6NdTCOtHtkeZe8tnYxj-6nnSZ
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aed8f02 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DnMRqvjp_ngGNQOL0aAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX/SkhdQBZizus
 4tkh2lJgylg0G5SimDPYMEwGktHO5/QJuTTMVOpN646GOMEFYFzCLmAWvsjBNT+FPar8ET2ecXD
 FNHghTmIDbPPvofy01Yy1xRzkCoBVCc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 74 ++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269a..0ad0935d72b65 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4480,6 +4480,80 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac53000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "titan_top", "mx", "mmcx";
+
+			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi",
+				      "camnoc_axi_src",
+				      "core";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x2040 0x400>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <262560>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <524760>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <978600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1095600>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1

