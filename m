Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616161;
	b=E5hT9Vpaa5HHWMaCcUS+BCJU2J7lKr3GO66KsebtEhBDOiGtSS6Pg80jxJXefJRoF7FN
	 AYIefVjJC5noLQR5nWrmhCIUziHBF7C13E1CI3DTf5Igg0uzqiupJEHvuJXv2XLn+hGQK
	 mVQ6pBRoQwZZcHhnxWM1IhtI9A0/3vA5yB1EQerG5hZHNId6m8MVMr7aoPNfJRkaSRmXp
	 7C2xKwBiJooDDLzhDX/C+NMYIr6mDmB2Baul6JepETj7Uy4NRnIFBTBW5/5dqEefhHxxM
	 MrViCk4EfnD9XuhXMDtLg4Bn/bw1OC4AyHEmpCLnY7Z3ecblVXnV3lJCBkCrIk47h1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cgka1rPSD1MtnYnhbQqfA3lW7bQ6yfuyxZAx3MFMHDs=;
	b=M6ST5tHerYCT/gB4mQHpjXkrCDaMlwdxqIM7maZRYnqzS6pdF1Xy2BZCaSh0WZyVecxB
	 omnFdvI/UsLky0tr4YxXeV3DxVuK3Mfd9VZKKlYpNYFfjgyE0VR2/6zjHb/HVZc7uRjTV
	 DDIM2kZ+7t8yCATNEu/D2j3UkyYLGdWsQAroKB6mVjx5P7yu5yb9KTHF5kXOukwIGfbnj
	 t4T8OqqodZobBltksPcjEclRKuCkf40Ciq8XTKDsgI/bzdEiriWmBgfDq6nbeokCmytAX
	 RFriRdjeeQfXBgUtypjIwe7XG5wnGFFMIT33k3QR9BSLLnp9WIdicBIxmOW9L2CvYSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EaTlsDDr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxLq2oOo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EFC60A2618
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EFC60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EaTlsDDr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LxLq2oOo
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A04d3402437
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgka1rPSD1MtnYnhbQqfA3lW7bQ6yfuyxZAx3MFMHDs=; b=EaTlsDDrh5gp6ede
	0UEZe6UxiY6HXUtQFTnduSvtlN7jKnXZ4VDEePkiPIw0NugXp8gAfY3bhJQKAAgw
	AQPkEyGsQc3pvspvhwvJitw8u8UnG8XA0s7SBESEYihu+VyRSugu6LtNKDw/eyd9
	fgrchYOmfLIE5a3gXRBEcvd+/g1IHgv8erpo6I6tkbLOukmOOye8KKQ9+s7B0+yT
	cjyBrltSzhh96ea9KZYU6t//4+CKcoPb7+Y5e27DaXl9r6p6iRmheQTl8Tr9scBc
	f1lKCOt1iHirMXvc5+G0RK0y+dGYQSWVyl8maE+kbOSS4WHHoQvyjZCpeXsrwV5T
	QtnOKw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8q1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:42:40 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f8281066c4so3882934b6e.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616160; x=1794220960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgka1rPSD1MtnYnhbQqfA3lW7bQ6yfuyxZAx3MFMHDs=;
        b=LxLq2oOoZM4XjXiqKZZYLU6571woLp9hYPnXRkad+PeHyt38Dd9+nV4siPyjD4Smf4
         mEJXlEGPLwCrnfnFvUxs5+2txg3dXFQ4z5EireL5ICmmKwDCFs686+6C26bwAqLIsRzV
         huQgbV1vWiWCz67RHyIa2sWttKJra03+HqbTsTRELJHSgf3rW3qpIz7eEbtBDNJGy6oC
         6k0hbtzHfLCFdTNER9trYqNz+afuhyY96Las+9dAXf3DmQ38t8Zj/7T5fE4H1yRtM6py
         9o/37weNEM6eQe4T7XG8prfhYo2UUBhl3gw7H7DfhmmwqMyO9ZFtxuYKnolGU+m5kj/B
         GzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616160; x=1794220960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cgka1rPSD1MtnYnhbQqfA3lW7bQ6yfuyxZAx3MFMHDs=;
        b=SmDyfrDJsEZKwPKC+be6OlLw2PjjdQZmx2b2YqxvbXUgg+AycWp0PlObRY3GVZPVL9
         1NQJuDHZ1WzmTw/TbDDx9nYL7cAiIrRFk6ymoVKAhnLFyirbGy47fLq5J1SY5yY2Ysa7
         CscldafMdMFOi/Tdh4TFAFrAwBZclfa4xHZb7+nL7ejMrHmmqySwDCYYc6Yxn8WAebap
         AaGPbTtdMbcN3s0wQ7hwpLvLbQMwpmACLIhrwiS6zpA4EOQG+MgLkP2h2gdDrn79Ww9h
         8M8IRReu99hWI/4XArISfBjkObYRKMnBrC6Bwb5spA8VHRKzIIF/+2KP7yeIL6LefGP9
         orgA==
X-Forwarded-Encrypted: i=1; AKwUvByPoxHQd1uFLUqhPPcMqUTmlWp/KZHRYjk5Zm0MQwUCS7laMaVik2ZaHzHuT0MSw31a3nSB57+R08FRFQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJAh1v2oJfskmOdlGOoN5kwuBTsnzS7zoFSNe2gMf9MkOkCUDqk
	OWIKZCJMqAMfABDsSFwHDJkttqYaDyPmDQi1AK0LBYTDTQhHAqV5e/eCy+9+4nLyY0w1C8qeS0t
	pplqMbJvK9g9EV8XjkJcE/pI+NoUS45pjgam4rEu1Qnl1XJehctZj1lVE7eUaNLNhIg==
X-Gm-Gg: AYBFou1iq6RiJwcPSCG4ZfIgL69tmBs6OIU/1L5AbIinqrr2Fde1g/VjIDJXShBcJkq
	m8DlVIGTCFbGzyMp11J5Afva24sA95GMKNp/YluBHp/5PHccIMw6BPUvqYsEsnt/NtNCvCaYtaD
	qHS3LQb324ONkISk2lvqvGrZc/vHP70VljbfdXdLDK+tGd64UbAamRide52Rw19TmbmOl/OzckU
	8rO6/4TpDKoST/oWqdyuSzthTeN7ctXsJBJN5hBgFB78TaA9yymbJz1bhBIOvLXjBYZ/AM3lOsf
	LvK9OkHYiHt7Fc98qqIUM7qvbPQQz9cyLQg84AxVsGPnqDqtFFhUhc7dOhdbinAKkaAQsMK5/pt
	/HgOWige7GkmOOeANLZOhNYiY/q4BXZkpPEmTmgJtteTpW7rBgC0SL2dmvlseUVCvCpqG+U5aX7
	zd98WUXg3EsNY1akvrY0KefcnnQZDnlEXM0QEm+RN0iat9NoSgrr7zcNgcMMw=
X-Received: by 2002:a05:6808:6708:b0:549:e9e3:9490 with SMTP id 5614622812f47-5640ddfb120mr6422799b6e.23.1793616159833;
        Mon, 02 Nov 2026 02:42:39 -0800 (PST)
X-Received: by 2002:a05:6808:6708:b0:549:e9e3:9490 with SMTP id 5614622812f47-5640ddfb120mr6422777b6e.23.1793616159349;
        Mon, 02 Nov 2026 02:42:39 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:38 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:20 -0800
Subject: [PATCH v24 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
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
Message-Id: <20261102-kaanapali-camss-v24-12-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae86920 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YXrfeFT6_K0meoKCAT8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX5+XNKOZA615R
 vdPzR4P+QfNN5leIjgvFYoOS8Gn0e1inrXnYMgwNjPIiR+OAcP981Xv4Am2LN8j+xK04Nl2y1NU
 eztyHtLLYYFZlKG85rzodCBBExAbACUOU1xOqc5+VMZAldi3DHpvmE2PEeYv0ZFDO5DgGw210pg
 +fu7E1fKqa5KirWIaXmcNeWHEGLz+4M9OBJmpcWhZlgpkd203BfP/dLVNGyPyHdugXXWm3I9/+A
 sFFNZ7PtwCJnb1qHha/k3fBZcOKwl0KWXm8nIPTiMMJfqiP3XT0o6Jrq5fB8L/VameYI6yly4To
 qK+fA4VMXMrxPSxLuAHkraPh45HP40HROz/kskUGvGAo9C4T4DLoK1UH8T5XzRHrw2dNnZ8S9mV
 T2wAQFd7VbR/muzLCfI/8BYpmJy1wUGLHqHSLINetR03MbknSFjP5CZukmMHG3T3Ofl15LoehJT
 NTVWvwxM0+QcwwQwV0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX7vnRTkqpLwFl
 YITcOqe9pFiqcpJ1BDkxY8xnu9aLoEESQLEPMtu9AHAPX4JaO/X4WRj1/0C9x8eFNHz6rqzeWK/
 0SntC/KK+ErvaGpXYrivBjn0njm8T0c=
X-Proofpoint-ORIG-GUID: vavnqG0Vl56Hvuy1M3N1mmYmKaAd9PNN
X-Proofpoint-GUID: vavnqG0Vl56Hvuy1M3N1mmYmKaAd9PNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
can be enabled by board device trees.

The camera subsystem contains:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 399 ++++++++++++++++++++++++++++++++
 1 file changed, 399 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..e107bcdf0f8e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -3597,6 +3598,382 @@ usb_dp_qmpphy_dp_in: endpoint {
 			};
 		};
 
+		camss: isp@900b000 {
+			compatible = "qcom,kaanapali-camss";
+
+			reg = <0x0 0x0900b000 0x0 0x1000>,
+			      <0x0 0x09253000 0x0 0x5e80>,
+			      <0x0 0x09263000 0x0 0x5e80>,
+			      <0x0 0x09273000 0x0 0x5e80>,
+			      <0x0 0x092d3000 0x0 0x3880>,
+			      <0x0 0x092e7000 0x0 0x3880>,
+			      <0x0 0x093fd000 0x0 0x400>,
+			      <0x0 0x093fe000 0x0 0x400>,
+			      <0x0 0x093ff000 0x0 0x400>,
+			      <0x0 0x09151000 0x0 0x20000>,
+			      <0x0 0x09171000 0x0 0x20000>,
+			      <0x0 0x09191000 0x0 0x20000>,
+			      <0x0 0x092dc000 0x0 0x1300>,
+			      <0x0 0x092f0000 0x0 0x1300>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "tpg0",
+				    "tpg1",
+				    "tpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csiphy_rx",
+				      "gcc_axi_hf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "qdss_debug_xo";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc";
+
+			iommus = <&apps_smmu 0x1c00 0x00>;
+
+			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+					<&camcc CAM_CC_TFE_1_GDSC>,
+					<&camcc CAM_CC_TFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				camss_csiphy0_in_port: port@0 {
+					reg = <0>;
+				};
+
+				camss_csiphy1_in_port: port@1 {
+					reg = <1>;
+				};
+
+				camss_csiphy2_in_port: port@2 {
+					reg = <2>;
+				};
+
+				camss_csiphy3_in_port: port@3 {
+					reg = <3>;
+				};
+
+				camss_csiphy4_in_port: port@4 {
+					reg = <4>;
+				};
+
+				camss_csiphy5_in_port: port@5 {
+					reg = <5>;
+				};
+			};
+		};
+
+		csiphy0: phy@9523000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09523000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy0_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy0_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@9525000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09525000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy1_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy1_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@9527000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09527000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy2_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy2_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy3: phy@9529000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x09529000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy3_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy3_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy4: phy@952b000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x0952b000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy4_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy4_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy5: phy@952d000 {
+			compatible = "qcom,kaanapali-csi2-phy";
+			reg = <0x0 0x0952d000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "ahb";
+
+			interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "top",
+					     "mmcx",
+					     "mx";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				csiphy5_in_port: port@0 {
+					reg = <0>;
+				};
+
+				csiphy5_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		camcc: clock-controller@956d000 {
 			compatible = "qcom,kaanapali-camcc";
 			reg = <0x0 0x0956d000 0x0 0x80000>;
@@ -6548,6 +6925,28 @@ pdp_tx: scp-sram-section@100 {
 		};
 	};
 
+	csiphy_mxc_opp_table: opp-table-mxc {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+	};
+
 	thermal-zones {
 		cpullc-0-0-thermal {
 			thermal-sensors = <&tsens0 0>;

-- 
2.34.1

