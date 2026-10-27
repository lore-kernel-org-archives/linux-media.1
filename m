Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094882;
	b=IwX2AbEmc3YTmxP5YACycq1lmMYMu5N2oufx03ODiy9Qs6ZDGHT/3AiarF0Nd7rOz7xO
	 3n7hpd32y3RipNElxFK6DfWrqKN1UFNNg1dMfRU7DMxj2N+vWfri2szHYD8t9DH2Sq1K5
	 3itn8637F5XxrrBWopsSe/3LgD5JR+oCPyQps/rbugYJT4dKaCkFZDiUpyIJDanXJ1Kbh
	 gFvlIZNtdhTwah1bi4OzJsDjTJZGA4cWmUv470WvQc+KFiLPKLboQCNHYItZYVqi53RkH
	 t/7iePT5T66zIPQTBMwz1s3Ptb8/N7GL/EiusW/JNrSnhD+wGUFqkzlqqgCOn8FmClQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094882;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RC3LSUj/Y+l+ZeEFgu7Mk7yghLVJQ1fv0cPULmplmrs=;
	b=msvjsoRA58TAlkkjgcZpVX6aw0ePA5z1xaz+Ap5bA72afxJ9kSorldIh9kWx7NvYK1iM
	 uM94tPJO1vPFX/Vgpyj531shnW1Gl0+CJNOEbcPl/HeJvv96eHwJIMZxMw28Oc/YJhzV1
	 z72UFeMKxTqYSljyqM2rb2ZgAGgA4G51UFDJ2ObvbuZRCKAO8J1Ole6Jwm3vsVWeYTTHU
	 qu4HuMF4X7PR3dzMloj5LzxcFg5BzOAvo8ZuxpcnA/xDUFzhn2675QMHI3Of/vXN6RpP4
	 97G05QYNV0pOO7kAEDMH1cx9txdStiER5Hct6MXLsiP46WsoxEk/PA0HxL6nITzXwhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nz6FXYNF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63086606A31D;
	Tue, 27 Oct 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nz6FXYNF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC17E1F01825;
	Tue, 27 Oct 2026 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094882;
	bh=RC3LSUj/Y+l+ZeEFgu7Mk7yghLVJQ1fv0cPULmplmrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Nz6FXYNF9tnhKYD9PyCm7v6VZQOj/GALYwmAKkx3L+/JLInlfcZ3cM3fZDEgu5Sk4
	 pyH/Zjew3vKJ+/xZHyEbAz6XCyINKIs7EE7SA4dgnQPUkr0aJzB07EWJN0A6uq6JSZ
	 inBBEfdX6cw5C0YYCNdyXRRA3yOpE+a2PTdLlaZKhpXknmEuQrtqdBubJjWSc/QJ7O
	 rFBDaSDgIHxyqnD8WTKAouX2i9wQpEOOKenKfyMH89isbtDlaRE0ft4t13scKEOI0s
	 qRXqWCo8G9c7MsUcqlqAIvhxlB+j/U3+Oaq2ANP8PnpCqVbAT9EkA8u5l/xEj6Kmr+
	 bEJoYiLoIcxyA==
Message-ID: <0d25a732-ccd5-4a7b-9809-93e67899b4e7@kernel.org>
Date: Tue, 27 Oct 2026 11:54:36 +0200
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
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-5-vz@kernel.org>
 <CAFEp6-03Kqxya74Cd+hgueZ0D4xAcYNOx_R1sNqdMu2JrMBynw@mail.gmail.com>
 <378094fb-5f7f-42c6-a91f-158e2083a6cb@kernel.org>
 <CAFEp6-3XTotgkOKRACGLT91wUw30CgFB=44RtHnXfA6cOF7bVA@mail.gmail.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <CAFEp6-3XTotgkOKRACGLT91wUw30CgFB=44RtHnXfA6cOF7bVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/27/26 11:07, Loic Poulain wrote:
> On Mon, Oct 26, 2026 at 11:39 PM Vladimir Zapolskiy <vz@kernel.org> wrote:
>>
>> Hi Loic.
>>
>> On 10/26/26 18:32, Loic Poulain wrote:
>>> On Fri, Oct 23, 2026 at 6:31 PM Vladimir Zapolskiy <vz@kernel.org> wrote:
>>>>
>>>> Add Qualcomm Waipio CAMSS device tree node to the platform dtsi file,
>>>> the CAMSS input ports are connected to output ports of CSIPHY devices.
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sm8450.dtsi | 167 +++++++++++++++++++++++++++
>>>>    1 file changed, 167 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>> index babf1a4196a1..7f5b0501a23e 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>> @@ -3310,6 +3310,167 @@ cci1_i2c1: i2c-bus@1 {
>>>>                           };
>>>>                   };
>>>>
>>>> +               camss: isp@acb6000 {
>>>> +                       compatible = "qcom,waipio-camss";
>>>> +                       reg = <0 0xacb6000 0 0x1000>,
>>>> +                             <0 0xacb7000 0 0x1000>,
>>>> +                             <0 0xacb9000 0 0x1000>,
>>>> +                             <0 0xacbb000 0 0x1000>,
>>>> +                             <0 0xacc6000 0 0x1000>,
>>>> +                             <0 0xacca000 0 0x1000>,
>>>> +                             <0 0xacf6000 0 0x1000>,
>>>> +                             <0 0xacf7000 0 0x1000>,
>>>> +                             <0 0xacf8000 0 0x1000>,
>>>> +                             <0 0xac62000 0 0x3000>,
>>>> +                             <0 0xac71000 0 0x3000>,
>>>> +                             <0 0xac80000 0 0x3000>,
>>>> +                             <0 0xacc7000 0 0x2000>,
>>>> +                             <0 0xaccb000 0 0x2000>;
>>>> +                       reg-names = "csid_wrapper",
>>>> +                                   "csid0",
>>>> +                                   "csid1",
>>>> +                                   "csid2",
>>>> +                                   "csid_lite0",
>>>> +                                   "csid_lite1",
>>>> +                                   "tpg0",
>>>> +                                   "tpg1",
>>>> +                                   "tpg2",
>>>> +                                   "vfe0",
>>>> +                                   "vfe1",
>>>> +                                   "vfe2",
>>>> +                                   "vfe_lite0",
>>>> +                                   "vfe_lite1";
>>>
>>> Is there a camss "top" register to describe here? e.g. to retrieve the
>>> CAMSS hardware version.
>>
>> I'm not aware of anything like that. What is "CAMSS hardware version"?
>>
>> CAMSS embraces various blocks, there are CSID and VFE, full and lite
>> IPs, and all these components do export their versions individually.
> 
> I mean, CAMSS usually has a top-level register block (often top or
> cpas_top) that contains the Titan/Spectra version information, along
> with various global configuration and mux registers.

On SM8450 there is "cpas_top" register <0xac13000 0x1000> (not in the
series), I believe you reference to it.

Is CPAS a natural part of CAMSS? Can it be modelled differently, e.g.
as a separate device/driver, like it was done with JPEG or CSIPHY?

I see that there are only SM6150 and SM6350 platforms mention this
register, to capture and process frames on SM8450 there is no need
to program CPAS.

Note, that even SM6150 and SM6350 platforms do not use this register,
it makes it redundant.

> In particular, exposing this block could be useful for reporting the
> Spectra version to userspace, for example through libcamera.

It could be so, but adding dead code is an anti-pattern in software design.

> Moreover, if the goal is to describe the CAMSS hardware exhaustively
> in DT, this block should probably be represented as well. Whether it

Here I oppose such a goal as impractical, the set goal is to get working
camera on the platform with the minimum of irreversible changes. It was
proven multiple times in the past, that "an exhaustive description"
equals to "the totally broken description", and brings nothing valuable
but irrecoverable ethernal problems to overcome.

> belongs in this specific binding is open for discussion, but my
> inclination is that it does.

This register is not needed to get CAMSS up to the functionally
working stage, which is represented by the series.

I believe someone may create a new fancy CPAS device driver or so, and
the new device driver will utilize the "cpas_top" register and other
CPAS resources in a better way, the register shall not be nailed to
the CAMSS preliminarly.

-- 
Best wishes,
Vladimir
