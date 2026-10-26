Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054357;
	b=g3iVQrqSO2J50mhdhTVksU2mOUp5en9w1sygvtiOa46UnbNdO6f2tbYvspk0O1WE6xIJ
	 hC3XExHoKiFdcJHcoov0wI6tptDB3do6iQJfbL8jDVBaStWX3grbEcYok1wiFyKiPURnc
	 q6p2FIzKD0iBwa8d8x+syhxCQIj11QEUIpIEFb7OwaBy0MhU7zAsD8s+bCk6Eexw2RAc5
	 bDR1FdUfrfKrlaHBktGDH+f6DXQaWLINz76qXf2XKhC9wdjYlJdgVNyDu3icRv92X8bq+
	 XkZvtBgnvaSdXKPYoDzFYu+/WRoIZjYkOVq//jkQZrMJgwm4ybcAILv0Hkp5pwyvsjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054357;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A1eR4A/QNGx4Y3JbfvLkzgmkQj82YlIwsgDeUWzBzZc=;
	b=c076crNE2dkRpET8uaY+Q9FOQ6/XgYe00R/LGuncC6bt7+AIswTT+b8NsBbfx8HnAlbZ
	 zDITcJHiJiP8FjETbya2bSle2/dpjgS0U76KZlpTAXfRQXJxn3QK/zJtBmjc5AnkupXEi
	 bP3PcALXehql+v3Khh0zmXPes6NvhhcdK/gkc3obGai775HTd4AAygCbQer06fNZe36pR
	 AGEplEf4j9XnxOAKrL3QnD7xD8r1FfnsjLYEiV3ukTud6ftR2mMKPcKjEGUlGMa6i3bbv
	 yC+qjF22euwqM7qzCSla8XsFzk5L6nmLoyDJdun8kh7MdmH09LFCcoJvBgRbbiu2Wlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PUX9S7YR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F0606A31A;
	Mon, 26 Oct 2026 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PUX9S7YR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC381F01829;
	Mon, 26 Oct 2026 22:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793054356;
	bh=A1eR4A/QNGx4Y3JbfvLkzgmkQj82YlIwsgDeUWzBzZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PUX9S7YRj/qhqjUPrrVxXucchCSKzIfyOnLi1ZgqVBHqJy6FOi7Hqoa3/yAQK8BBY
	 4+WXC61g5wYSclM1etoWPajx7FqMnH3i03PuFoOlxsa5dMSVPCbKm3ashx94dzCyHf
	 4Id6H1oZBqwuxoeP2KEF3FKEkYTyALJtsB/io0r7dZZ/CC34RZcvHQtTG1JVOJLoev
	 c/dNQsPnvd7CsFDLufIOITFCEIVy8+XwZHFxR0+FWgX8aNXXxBrs2pQOIDMzxpKhUn
	 2y0q4fdvKHMz3oC3WMHMRiA/GcUHM8spzQSyejcwS4MgqGfQMQQTRC6OqC4qRoRzgT
	 B69yH0CzYJlIQ==
Message-ID: <378094fb-5f7f-42c6-a91f-158e2083a6cb@kernel.org>
Date: Tue, 27 Oct 2026 00:38:57 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-5-vz@kernel.org>
 <CAFEp6-03Kqxya74Cd+hgueZ0D4xAcYNOx_R1sNqdMu2JrMBynw@mail.gmail.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <CAFEp6-03Kqxya74Cd+hgueZ0D4xAcYNOx_R1sNqdMu2JrMBynw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Loic.

On 10/26/26 18:32, Loic Poulain wrote:
> On Fri, Oct 23, 2026 at 6:31 PM Vladimir Zapolskiy <vz@kernel.org> wrote:
>>
>> Add Qualcomm Waipio CAMSS device tree node to the platform dtsi file,
>> the CAMSS input ports are connected to output ports of CSIPHY devices.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 167 +++++++++++++++++++++++++++
>>   1 file changed, 167 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index babf1a4196a1..7f5b0501a23e 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -3310,6 +3310,167 @@ cci1_i2c1: i2c-bus@1 {
>>                          };
>>                  };
>>
>> +               camss: isp@acb6000 {
>> +                       compatible = "qcom,waipio-camss";
>> +                       reg = <0 0xacb6000 0 0x1000>,
>> +                             <0 0xacb7000 0 0x1000>,
>> +                             <0 0xacb9000 0 0x1000>,
>> +                             <0 0xacbb000 0 0x1000>,
>> +                             <0 0xacc6000 0 0x1000>,
>> +                             <0 0xacca000 0 0x1000>,
>> +                             <0 0xacf6000 0 0x1000>,
>> +                             <0 0xacf7000 0 0x1000>,
>> +                             <0 0xacf8000 0 0x1000>,
>> +                             <0 0xac62000 0 0x3000>,
>> +                             <0 0xac71000 0 0x3000>,
>> +                             <0 0xac80000 0 0x3000>,
>> +                             <0 0xacc7000 0 0x2000>,
>> +                             <0 0xaccb000 0 0x2000>;
>> +                       reg-names = "csid_wrapper",
>> +                                   "csid0",
>> +                                   "csid1",
>> +                                   "csid2",
>> +                                   "csid_lite0",
>> +                                   "csid_lite1",
>> +                                   "tpg0",
>> +                                   "tpg1",
>> +                                   "tpg2",
>> +                                   "vfe0",
>> +                                   "vfe1",
>> +                                   "vfe2",
>> +                                   "vfe_lite0",
>> +                                   "vfe_lite1";
> 
> Is there a camss "top" register to describe here? e.g. to retrieve the
> CAMSS hardware version.

I'm not aware of anything like that. What is "CAMSS hardware version"?

CAMSS embraces various blocks, there are CSID and VFE, full and lite
IPs, and all these components do export their versions individually.

>> +                       clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                                <&camcc CAM_CC_CORE_AHB_CLK>,
>> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                                <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
>> +                                <&camcc CAM_CC_CPAS_IFE_0_CLK>,
>> +                                <&camcc CAM_CC_CPAS_IFE_1_CLK>,
>> +                                <&camcc CAM_CC_CPAS_IFE_2_CLK>,
>> +                                <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
>> +                                <&camcc CAM_CC_CSID_CLK>,
>> +                                <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
>> +                                <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                                <&camcc CAM_CC_IFE_0_CLK>,
>> +                                <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
>> +                                <&camcc CAM_CC_IFE_1_CLK>,
>> +                                <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
>> +                                <&camcc CAM_CC_IFE_2_CLK>,
>> +                                <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
>> +                                <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                                <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>> +                                <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                                <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
>> +                       clock-names = "camnoc_axi",
>> +                                     "core_ahb",
>> +                                     "cpas_ahb",
>> +                                     "cpas_fast_ahb",
>> +                                     "cpas_vfe0",
>> +                                     "cpas_vfe1",
>> +                                     "cpas_vfe2",
>> +                                     "cpas_vfe_lite",
>> +                                     "csid",
>> +                                     "csiphy_rx",
>> +                                     "gcc_hf_axi",
>> +                                     "vfe0",
>> +                                     "vfe0_fast_ahb",
>> +                                     "vfe1",
>> +                                     "vfe1_fast_ahb",
>> +                                     "vfe2",
>> +                                     "vfe2_fast_ahb",
>> +                                     "vfe_lite",
>> +                                     "vfe_lite_ahb",
>> +                                     "vfe_lite_cphy_rx",
>> +                                     "vfe_lite_csid";
>> +                       interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
>> +                                    <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
>> +                                    <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
>> +                                    <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
>> +                                    <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
>> +                                    <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
>> +                                    <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
>> +                                    <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
>> +                                    <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
>> +                                    <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
>> +                       interrupt-names = "csid0",
>> +                                         "csid1",
>> +                                         "csid2",
>> +                                         "csid_lite0",
>> +                                         "csid_lite1",
>> +                                         "vfe0",
>> +                                         "vfe1",
>> +                                         "vfe2",
>> +                                         "vfe_lite0",
>> +                                         "vfe_lite1";
>> +                       interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
>> +                                       <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
>> +                       interconnect-names = "ahb",
>> +                                            "hf_mnoc";
>> +                       iommus = <&apps_smmu 0x800 0x460>;
>> +                       power-domains = <&camcc IFE_0_GDSC>,
>> +                                       <&camcc IFE_1_GDSC>,
>> +                                       <&camcc IFE_2_GDSC>,
>> +                                       <&camcc TITAN_TOP_GDSC>;
>> +                       power-domain-names = "ife0",
>> +                                            "ife1",
>> +                                            "ife2",
>> +                                            "top";
>> +                       status = "disabled";
>> +
>> +                       ports {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +
>> +                               port@0 {
>> +                                       reg = <0>;
>> +
>> +                                       camss_csiphy0_inep: endpoint {
>> +                                               remote-endpoint = <&csiphy0_out_ep>;
>> +                                       };
>> +                               };
>> +
>> +                               port@1 {
>> +                                       reg = <1>;
>> +
>> +                                       camss_csiphy1_inep: endpoint {
>> +                                               remote-endpoint = <&csiphy1_out_ep>;
>> +                                       };
>> +                               };
>> +
>> +                               port@2 {
>> +                                       reg = <2>;
>> +
>> +                                       camss_csiphy2_inep: endpoint {
>> +                                               remote-endpoint = <&csiphy2_out_ep>;
>> +                                       };
>> +                               };
>> +
>> +                               port@3 {
>> +                                       reg = <3>;
>> +
>> +                                       camss_csiphy3_inep: endpoint {
>> +                                               remote-endpoint = <&csiphy3_out_ep>;
>> +                                       };
>> +                               };
>> +
>> +                               port@4 {
>> +                                       reg = <4>;
>> +
>> +                                       camss_csiphy4_inep: endpoint {
>> +                                               remote-endpoint = <&csiphy4_out_ep>;
>> +                                       };
>> +                               };
>> +
>> +                               port@5 {
>> +                                       reg = <5>;
>> +
>> +                                       camss_csiphy5_inep: endpoint {
>> +                                               remote-endpoint = <&csiphy5_out_ep>;
>> +                                       };
>> +                               };
>> +                       };
>> +               };
>> +
>>                  csiphy0: phy@ace4000 {
>>                          compatible = "qcom,waipio-csi2-phy", "qcom,x1e80100-csi2-phy";
>>                          reg = <0 0x0ace4000 0 0x2000>;
>> @@ -3349,6 +3510,7 @@ port@1 {
>>                                          reg = <1>;
>>
>>                                          csiphy0_out_ep: endpoint {
>> +                                               remote-endpoint = <&camss_csiphy0_inep>;
>>                                          };
>>                                  };
>>                          };
>> @@ -3393,6 +3555,7 @@ port@1 {
>>                                          reg = <1>;
>>
>>                                          csiphy1_out_ep: endpoint {
>> +                                               remote-endpoint = <&camss_csiphy1_inep>;
>>                                          };
>>                                  };
>>                          };
>> @@ -3437,6 +3600,7 @@ port@1 {
>>                                          reg = <1>;
>>
>>                                          csiphy2_out_ep: endpoint {
>> +                                               remote-endpoint = <&camss_csiphy2_inep>;
>>                                          };
>>                                  };
>>                          };
>> @@ -3481,6 +3645,7 @@ port@1 {
>>                                          reg = <1>;
>>
>>                                          csiphy3_out_ep: endpoint {
>> +                                               remote-endpoint = <&camss_csiphy3_inep>;
>>                                          };
>>                                  };
>>                          };
>> @@ -3525,6 +3690,7 @@ port@1 {
>>                                          reg = <1>;
>>
>>                                          csiphy4_out_ep: endpoint {
>> +                                               remote-endpoint = <&camss_csiphy4_inep>;
>>                                          };
>>                                  };
>>                          };
>> @@ -3569,6 +3735,7 @@ port@1 {
>>                                          reg = <1>;
>>
>>                                          csiphy5_out_ep: endpoint {
>> +                                               remote-endpoint = <&camss_csiphy5_inep>;
>>                                          };
>>                                  };
>>                          };
>> --
>> 2.53.0
>>

-- 
Best wishes,
Vladimir
