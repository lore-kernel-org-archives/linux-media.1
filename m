Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98C3B14D0;
	Wed, 10 Jun 2026 08:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081673; cv=none; b=mtajluy60FJ1gcGNDTH1sNMDo5J9+kSsoF6oYa3KNdFc9/zhHeqprYR4PK2tzH+6CECjWPuqsP/G3eBK1oB+X8WeLa1RIN7tnIDEEVIOYj/qyexD9eN0UPT10ZSZa8O3uk3GHdfGh8hMkY8w1sDOo+KcgR0y+LDOWsdWpS54LCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081673; c=relaxed/simple;
	bh=N5PAVY33a8UOCzFqSY8hiB8OI5zRrmjewKGaP/nZXrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzYLdUilVMogNo8y//c0RqTSMTkwWp6ljmqv3IAKOLwnoEyx4OlPNUcoDgM9PWt+E3vV1ZiUq8FLYIrqhK6pAhPaFeNjbilgqUBaA27AgNXcm+nUbgYX0PsS+3lFYM/ztPeFWgEtzib706HjiNEWZ66DJbmYkZazffkrlpAIU7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G64v79pq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G64v79pq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7451F00893;
	Wed, 10 Jun 2026 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081672;
	bh=0eGRKrLKV4PS4cxmYvW3x1zaSXwUY5isFocfs6vWoNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=G64v79pqf+q1pnoweLHsi2yhnFe5SRsDlMeUbR/e0ZlDgBb+aSfp+GEi4CKe8gnxs
	 /43qYE1ckQNoFT6Qru6jJoVAgcxAB8AHC0PuSe77vpZWtP2IGuFMWH1dG620y3+ebm
	 71PCRcuNmnAb7NOCEzivoeLHVv4G5XLkypQF7AiCQfyD9ELGUoFzFoLILZQaCGctQh
	 AQY1N2mzlqI3q7ExascjoEGLLfFOz78Qvsh4WNi2Ga2dP5ovpkmLfslxEUfUOM0Dt4
	 L34zA+/2TkCWk5e9EClm5+Nv/Z6YHwqr6QZhG6y3Syzg5jzeJoHnMmro+3rJESnLgU
	 IDBiyqGnKoQ8w==
Message-ID: <3d53b646-d5f2-4ca9-9d69-dc0899165c3d@kernel.org>
Date: Wed, 10 Jun 2026 09:54:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <5YTsRTMAUGw0it3GAWHhKIh77_Hk823-xRJ4WxzQ-ENpdnC9-ttUvWhJI_CqFEetmFXcRel50GK_o2UMGzwZmg==@protonmail.internalid>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
 <f793c665-ac99-4afe-a64b-bbd6d40044e5@kernel.org>
 <BMTIFxHuDURlDmZzZJTVeFB6LmfKxZHPKz3t2FEVk2jHRMdO-2_435jcKspeb-fET7XxgnFnsKMBfijBplRx4w==@protonmail.internalid>
 <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <bc9a8075-db42-4de1-a3cc-4f6816681290@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/06/2026 08:50, Vikash Garodia wrote:
> 
> On 6/10/2026 2:07 AM, Bryan O'Donoghue wrote:
>> On 09/06/2026 17:15, Vikash Garodia wrote:
>>> Document the iris video accelerator used on shikra platforms by adding
>>> the qcom,shikra-iris compatible.
>>>
>>> Although QCM2290 and shikra share the same video hardware and overall
>>> integration, their SMMU programming differs. QCM2290 exposes separate
>>> stream IDs for the video hardware and the Xtensa path, requiring two
>>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
>>> and Xtensa isolation requirements, such SMR masking is not applicable on
>>> QCM2290 platforms.
>>> Since shikra uses the same video hardware as QCM2290 and shares the same
>>> programming model and capabilities, it is added as a fallback compatible
>>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>>> two IOMMU entries.
>>>
>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> ---
>>>    .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++
>>> ++++++----
>>>    1 file changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>> venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-
>>> venus.yaml
>>> index
>>> 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e3f805c8e72ff0df 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>> @@ -15,12 +15,27 @@ description:
>>>
>>>    allOf:
>>>      - $ref: qcom,venus-common.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: qcom,shikra-iris
>>
>> Should this be "iris" in a venus yaml ?
> 
> given the vpu core was first enabled on venus and now it same core on a
> different SOC being enabled on iris. There are 2 ways to do this
> 1. Add the compat to existing schema which defines the binding for that
> core i.e existing patch
> 2. Write a new schema (or say duplicate it) with ...shikra-iris.yaml,
> but again, the shikra compat would fallback to "qcom,qcm2290-venus"
> compat. hence even iris yaml would then need to carry the venus *string*.
> 
> I followed the first option.
> 

I'm confused here. Your fallback is qcm2290-venus.

grep qcm2290-venus drivers/* -r

drivers/media/platform/qcom/venus/core.c:	{ .compatible = 
"qcom,qcm2290-venus", .data = &qcm2290_res, },

So shouldn't it be shikra-venus ?

---
bod
