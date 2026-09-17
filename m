Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E43ACF10
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621458; cv=none; b=uDrcaTyjpmRZ9gQJ+TgcOCopaY9RxU2PL0xh+enQQT58XqrUnokpgfc5YvhS5JBXw9VAdlWTXFZ32a3OB7cuqiGpE1/8CbUuL7UMecwR/+Q0uFyfomSO9bi0WtX+v6PFPv7k9Iquht5kp2mytKBvNXPnIT95tXgmGNU39MSXG5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621458; c=relaxed/simple;
	bh=Id7cPeh3xyB1aNfn1vlCvgnNy4gMDDjHlL1miViF5P4=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=Yfgm/XU41Ce4ZwOgqiTezTlsCVXGms2YHxdMDq2oWufc9YOVXFvSD42iu6Uyzin6nKY8atLpymCAJStO/dvG5Sld1gDTAk2TZpfsU+ehdx5f5sSA+V5staYNs90j/93dNGIoPhVD1Ny1dv1D0qYNwWf1mp6fk5EIN2caqiTTQoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4zqkRh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4xov9Kb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4zqkRh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4xov9Kb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GN1JHr3597344
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GfaEUOANYXiVoyTl4dqtSWKlwoRL2ErPMvyO+ShBXPs=; b=i4zqkRh33hFNQEa5
	B3FVPI+Im8RR8DCQBpcvbfKRqD+Jkr2SwD9955qujOkZZWtUNnV++XbDq0XBFVdy
	oueqIntB12FQUft5oE8E6rbJhYgCbuskOlXhGSE7vQXdP+Q4ujCIRIDgNJhHSnXI
	g3Ivm2zrr6lsZqmvWuolmMurC7oz6xHDXDrSyYoOYex4iV68Ej+HC3VwiCJG9fyU
	05YxGlXYUIloFj+NPuLRZL9LjzQRRBIq8M2Ul/a/oOZVWKuxYWyLdKcMaKAJUxNo
	JxANnpViM1iPv/ffphqUHvkFrQmJ/QSSphs3miUoIyvBe1YT9ph7tEhdXQRA+JNP
	kddxTw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxayaser-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:04:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d63bad3d09so7051935ad.3
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 22:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789621450; x=1790226250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GfaEUOANYXiVoyTl4dqtSWKlwoRL2ErPMvyO+ShBXPs=;
        b=P4xov9KbxWtZsA8XJor2V0iINsk4vsF2i+KeQiOdZj53jZ/Hafmr/z14PuVGbIJ+YG
         YLFUn+xZzPxcnGbehiKPC+YU9xxdxwF99g28KrE7pLn4TaozflQ/O1uhd2cgzDYps+IB
         O5h4vPzZy37kOJY7Uo08/DH9StgN6i2DAKxdEKBOLx/YzJQY2vjH3UQOKRki5FJLUA05
         dyLQNrRHJrkR+hwSBrqzoEp2UDR+xcVoT0p+Zk2CdfbvefBTmX2Z4CDCIQSl2ZnCgKMu
         AZwhReRMio3KItjwr6mgG2Q8hJuw3807KnCzYrAHh0JsgGCFRs2E1pA0GH9YI7/ECwgU
         qjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621450; x=1790226250;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfaEUOANYXiVoyTl4dqtSWKlwoRL2ErPMvyO+ShBXPs=;
        b=hHPMCaXBAAcn52YVUOQQbYHJy6Uc6uAwRgc3Dk5XzeRTIxGzvTqqKdoANydUwyxbjp
         XVVpjlF8cP+C00fMYn/Jm0grau8AZtX+GhKJRIsvnXk2atCQ1oW6CLVKXM+c4B/xOvld
         Mh4EUiMWjHvdeQqw4IkBZAtahEl+JuViL1NerTuNapDD/6TEfYaceCy+XcqvhpOMsYDw
         CIkJgQTK+PnrMWpVO02MP3C4sZrKJtpC5/Z8dZhGaFUxm06P8zZGU77OzpKCID3aNq/r
         MojDSYs7Pwiy8XBAg8JdeLiBjuKtsrkAI4x+UwFvv3IAhGbF+Ak8ti/Q0kq52FH7fiQY
         UUfw==
X-Forwarded-Encrypted: i=1; AKwUvByCpHN+2dJKiyKp+CbnkzW3kRRAuu2rlWAoC12JC18ZJ+6bgQ5Wl3XQq5OpLBotub3K/90g+U8qyilx7Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lJxUa2eH3bXK1KmY/rhB6F3xnzRTPlz9eSGZYzdmJGTOHs1JUa
	e/CwVBJs6ajt4nqxYc3oRdgLV2DTqBFluY/CLBjRgi0sz2+/rGvKRRqU9VWJ8TBW0Y5vTB2S6wm
	BoNj3QQe1oQJwz1yXq3kGS0SVpjmow5F4RkOmbVREv3kyvLojlSa22UBg90x4pFx9FA==
X-Gm-Gg: AYBFou2kJCfxYp27ZgtS5J9k8RCXiysvdKy2coK2AAOpBxRF91NLvh7FIVr6NHIMPy1
	gjE2k4HsyaUp8li8zPri02/H/p5VfqWa8tjx3XGFu0ixMciuuGXDXii01J+d6EHYyPOs7F7M05l
	doKO8JjgXGMUoPWb64ukYc6riVJ9HFd7cUfnvHOKnpZrIRhTg3qP9nqY8qNe6wCjkCfkbdB+PBR
	K/WHovJc0wxqKp8xZP6VZskIrxqW07BE8j3M1tazbkUmCRJLzp+Iuk3vDVyPwrCrd76pORGVpAs
	dW96SYbQLt0qsIgERhhahTEpKok98tnGscOrX4gy5O9CG3rsqsv6n1h6PMGZ1RlKSA7cAXqdWMQ
	3gKWDAp7kZEeiV+O154k/Fc4L6LiM5WGjIycv6L8wiA24FK8IByx2Xs1rNh4=
X-Received: by 2002:a17:90a:10c1:b0:39e:1ec9:dc8d with SMTP id 98e67ed59e1d1-39e1ec9e479mr8092628a91.24.1789621449644;
        Wed, 16 Sep 2026 22:04:09 -0700 (PDT)
X-Received: by 2002:a17:90a:10c1:b0:39e:1ec9:dc8d with SMTP id 98e67ed59e1d1-39e1ec9e479mr8092580a91.24.1789621449084;
        Wed, 16 Sep 2026 22:04:09 -0700 (PDT)
Received: from [10.233.16.42] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e390c2984sm586699a91.0.2026.09.16.22.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 22:04:08 -0700 (PDT)
Message-ID: <31a82ac0-23c8-4d6e-9328-7616a9ce1180@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 13:04:00 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v16 10/11] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
 <20260915-kaanapali-camss-v16-10-c9f3f6f4180c@oss.qualcomm.com>
 <CAFEp6-0rkoCLP19_veAWWBa7JPJMkZiTSy3tf_NyDHC0rFcnew@mail.gmail.com>
In-Reply-To: <CAFEp6-0rkoCLP19_veAWWBa7JPJMkZiTSy3tf_NyDHC0rFcnew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2NCBTYWx0ZWRfX2dSUX/AVj+/z
 JanbyR7g5gc+JxOAATjoAFizJgFBUfDXFFOhdxqODFGNXp/Qg+Q8gqJWdVSfIMevfWy9eDKafpp
 CuRUFd1dhyFhcIZTlgBL8tfEjhY7Y4skPMoMBOhj0SxkA9iEcWc/RzQrwK/I0z3109XYeIIo4sh
 T8UFQCTcgzFXDcdD76zJuoluPJRVScaVOFyu26Emp7XuCqthOXy9shNj1yKXGoQdXzAhcZWFEoU
 AJjTpv/HMevXwUOwltCrqp7XK7znkEDigEwaCfV+RS0DAC+JJF9evFCijKDAoCtxTclK5e+7ohr
 wsSlfmU8EkMY+XJVjPT2r69omeQcJOYbWhhBDvyjccflWm1C/W5uXIumXmi8dL512T8jq07KR2B
 9+Z21t+4cNqT9O2laOlQMdm0ox2ECTFrCEz087OwTRO86hBARzxz6L3Y202MvrhK0vH/GW1rxiP
 5uHAOOAt/Vy+jh3IorQ==
X-Proofpoint-GUID: AEYiYrFvyyFUo_5QypDfmdbZeoFYZJ4D
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aab74ca cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=mpCMojuaOHMLrBAV16wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AEYiYrFvyyFUo_5QypDfmdbZeoFYZJ4D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2NCBTYWx0ZWRfXwbSF/PVReywx
 hBY08wXu5eFhmYNp076gXUanlcfRv+xxpUHmuOuBJ2DaOOcs5NZm/Cm5KyoYAAmCoWW3a8tQZdS
 r8RHE7BYSPecomb1NKZLm0KwnJnx3mk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170064

On 9/15/26 9:16 PM, Loic Poulain <loic.poulain@oss.qualcomm.com> wrote:
> On Tue, Sep 15, 2026 at 12:10 PM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
> >
> > Add the three Camera Control Interface (CCI) controllers present on the
> > Kaanapali SoC. Each controller provides two I2C hosts used for camera
> > sensor control, so define the controller nodes and their pinctrl states.
> >
> > The first bus has two CCI bus master pinouts:
> > cci_i2c_sda0 = gpio109
> > cci_i2c_scl0 = gpio110
> >
> > cci_i2c_sda1 = gpio111
> > cci_i2c_scl1 = gpio112
> >
> > The second bus has two CCI bus master pinouts:
> > cci_i2c_sda3 = gpio113
> > cci_i2c_scl3 = gpio114
> >
> > cci_i2c_sda4 = gpio107
> > cci_i2c_scl4 = gpio160
> >
> > The third bus has two CCI bus master pinouts:
> > cci_i2c_sda5 = gpio108
> > cci_i2c_scl5 = gpio149
> >
> > cci_i2c_sda6 = gpio115
> > cci_i2c_scl6 = gpio116
> >
> > Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> We used to configure an assigned-clock-rate for the CCI core clock to
> ensure it generates the desired CCI master bus frequency (for example,
> a 1 MHz bus requires a 37.5 MHz core clock). Is it safe to assume that
> the firmware, or the default platform configuration, already programs
> the core clock to the correct rate?
> 
> Regards,
> Loic
> 
> 
> 
> 
> > ---
> >   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
> >   1 file changed, 303 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > index 84b93914ad53..02f8dab30b91 100644
> > --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> > @@ -3514,6 +3514,117 @@ port@5 {
> >                          };
> >                  };
> >
> > +               cci0: cci@941b000 {
> > +                       compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
> > +                       reg = <0x0 0x0941b000 0x0 0x1000>;
> > +
> > +                       interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
> > +
> > +                       clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> > +                                <&camcc CAM_CC_CCI_0_CLK>;
> > +                       clock-names = "ahb",
> > +                                     "cci";
> > +
> > +                       power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> > +
> > +                       pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
> > +                       pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
> > +                       pinctrl-names = "default", "sleep";
> > +
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +
> > +                       status = "disabled";
> > +
> > +                       cci0_i2c0: i2c-bus@0 {
> > +                               reg = <0>;
> > +                               clock-frequency = <1000000>;
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                       };
> > +
> > +                       cci0_i2c1: i2c-bus@1 {
> > +                               reg = <1>;
> > +                               clock-frequency = <1000000>;
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                       };
> > +               };
> > +
> > +               cci1: cci@941c000 {
> > +                       compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
> > +                       reg = <0x0 0x0941c000 0x0 0x1000>;
> > +
> > +                       interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
> > +
> > +                       clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> > +                                <&camcc CAM_CC_CCI_1_CLK>;
> > +                       clock-names = "ahb",
> > +                                     "cci";
> > +
> > +                       power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> > +
> > +                       pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
> > +                       pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
> > +                       pinctrl-names = "default", "sleep";
> > +
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +
> > +                       status = "disabled";
> > +
> > +                       cci1_i2c0: i2c-bus@0 {
> > +                               reg = <0>;
> > +                               clock-frequency = <1000000>;
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                       };
> > +
> > +                       cci1_i2c1: i2c-bus@1 {
> > +                               reg = <1>;
> > +                               clock-frequency = <1000000>;
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                       };
> > +               };
> > +
> > +               cci2: cci@941d000 {
> > +                       compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
> > +                       reg = <0x0 0x0941d000 0x0 0x1000>;
> > +
> > +                       interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
> > +
> > +                       clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> > +                                <&camcc CAM_CC_CCI_2_CLK>;
> > +                       clock-names = "ahb",
> > +                                     "cci";
> > +
> > +                       power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> > +
> > +                       pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
> > +                       pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
> > +                       pinctrl-names = "default", "sleep";
> > +
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +
> > +                       status = "disabled";
> > +
> > +                       cci2_i2c0: i2c-bus@0 {
> > +                               reg = <0>;
> > +                               clock-frequency = <1000000>;
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                       };
> > +
> > +                       cci2_i2c1: i2c-bus@1 {
> > +                               reg = <1>;
> > +                               clock-frequency = <1000000>;
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                       };
> > +               };
> > +
> >                  csiphy0: phy@9523000 {
> >                          compatible = "qcom,kaanapali-csi2-phy";
> >                          reg = <0x0 0x09523000 0x0 0x2000>;
> > @@ -4224,6 +4335,198 @@ tlmm: pinctrl@f100000 {
> >                          #interrupt-cells = <2>;
> >                          wakeup-parent = <&pdc>;
> >
> > +                       cci0_i2c0_default: cci0-i2c0-default-state {
> > +                               scl-pins {
> > +                                       pins = "gpio110";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio109";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +                       };
> > +
> > +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
> > +                               scl-pins {
> > +                                       pins = "gpio110";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio109";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +                       };
> > +
> > +                       cci0_i2c1_default: cci0-i2c1-default-state {
> > +                               scl-pins {
> > +                                       pins = "gpio112";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio111";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +                       };
> > +
> > +                       cci0_i2c1_sleep: cci0-i2c1-sleep-state {
> > +                               scl-pins {
> > +                                       pins = "gpio112";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio111";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +                       };
> > +
> > +                       cci1_i2c0_default: cci1-i2c0-default-state {
> > +                               scl-pins {
> > +                                       pins = "gpio114";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio113";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +                       };
> > +
> > +                       cci1_i2c0_sleep: cci1-i2c0-sleep-state {
> > +                               scl-pins {
> > +                                       pins = "gpio114";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio113";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +                       };
> > +
> > +                       cci1_i2c1_default: cci1-i2c1-default-state {
> > +                               scl-pins {
> > +                                       pins = "gpio160";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio107";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +                       };
> > +
> > +                       cci1_i2c1_sleep: cci1-i2c1-sleep-state {
> > +                               scl-pins {
> > +                                       pins = "gpio160";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio107";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +                       };
> > +
> > +                       cci2_i2c0_default: cci2-i2c0-default-state {
> > +                               scl-pins {
> > +                                       pins = "gpio149";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio108";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +                       };
> > +
> > +                       cci2_i2c0_sleep: cci2-i2c0-sleep-state {
> > +                               scl-pins {
> > +                                       pins = "gpio149";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio108";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +                       };
> > +
> > +                       cci2_i2c1_default: cci2-i2c1-default-state {
> > +                               scl-pins {
> > +                                       pins = "gpio116";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio115";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-up;
> > +                               };
> > +                       };
> > +
> > +                       cci2_i2c1_sleep: cci2-i2c1-sleep-state {
> > +                               scl-pins {
> > +                                       pins = "gpio116";
> > +                                       function = "cci_i2c_scl";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +
> > +                               sda-pins {
> > +                                       pins = "gpio115";
> > +                                       function = "cci_i2c_sda";
> > +                                       drive-strength = <2>;
> > +                                       bias-pull-down;
> > +                               };
> > +                       };
> > +
> >                          hub_i2c0_data_clk: hub-i2c0-data-clk-state {
> >                                  /* SDA, SCL */
> >                                  pins = "gpio66", "gpio67";
> >
> > --
> > 2.34.1
> >
> 

Hi, this is safe on KNP. The CCI source clock is derived from the PLL0 even clock through a fixed divider, which results in a fixed 37.5 MHz CCI core clock. As a result, no assigned-clock-rate property is required on this platform.

Other platforms may have different clock topologies and should be evaluated independently. Thanks for your attention.

Best regards,
Hangxiang
