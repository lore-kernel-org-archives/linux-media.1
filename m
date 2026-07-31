Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EAF3A168C;
	Fri, 31 Jul 2026 14:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506492; cv=none; b=Htdr0cOkZ+0bE7wnCbqY3CkAFcEQJ5fTSUuXta7cpWlra2M9rIGKdqnGP4WjhlF/HfVIGYEtFtOAQ4AF2BpjXFm6BUYksDPkiUfBLc3mGig21dUvGs79erDZ4BFeKVSQadOLEnUN/JQydKDz3d0k3kpNq80gLDPzpSZvAEAjlPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506492; c=relaxed/simple;
	bh=Vn48FDpUIgwcXBdLWNEYJHU1lPBsWdJyjygHLQq3KUE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=s4xRp6DUODEtJzULJiE8iSeSif3BtnBKe885qUonwul+5j7ZFt7CESvVMVdalFMg4vvdO9r5E+UPLZgaAtnNLsFq6dmT5qLGuh7Y2h1DK4pgEP9t6/usA4jS5iCJ829tO4oIUVsN8L3IBOw3M8AqUKkaIfWTgccN2I51W3BDkMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E64Fex+S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E64Fex+S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4440C1F000E9;
	Fri, 31 Jul 2026 14:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785506490;
	bh=R7Jr5VQjLr7EGeIVOrImuJiS3Zl7uoC74z7poslGHw4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=E64Fex+Srrrwf9NrWgGi/1yDwr4gGT/wxsutGFH9NV2uiRq6cHVi29nd0eUGc17Fm
	 k50ItJ9k9i600fz2mQ9rQim/ftqbnq05jwS4hw80Q3+/J8NQ1DdHT4d4QMuoYqgAW4
	 lfBRNwLkqSWCLz/fmSvuY44jpjhCqBIF0G4JzA2cEFPcrzed81omeNg/Pbg1q9y6x7
	 HEEi/QLGwJ2Z3DEa31D+cVQEFHIhxNWjAK3kNdRI5sCL/CP+4O9hyTh7EF2chq4aeR
	 09H36+cj5G2J5krqlqSSUbSQEkO5+ieRE8GOjoMm7YpLaBBR6T/cvluvaICo4qFny8
	 QV6sHRPZQYeUQ==
Message-ID: <5987b024-9595-4632-9cb0-6d696520e949@kernel.org>
Date: Fri, 31 Jul 2026 15:01:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
From: Bryan O'Donoghue <bod@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
 <mFvFwhQszGFrmshFXIYuZ91Cp8BgbKaIBxeQtsJD1IOsPNjLaXD8DwNsshTiIbtUFQo_rCFFyu497tLirPBJvQ==@protonmail.internalid>
 <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
 <543f447c-bd6a-41ae-a413-fa2eb74be9a0@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <543f447c-bd6a-41ae-a413-fa2eb74be9a0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/07/2026 14:39, Bryan O'Donoghue wrote:
> On 21/07/2026 18:32, Vikash Garodia wrote:
>> diff --git a/Documentation/devicetree/bindings/media/qcom,venus- 
>> common.yaml b/Documentation/devicetree/bindings/media/qcom,venus- 
>> common.yaml
>> index 
>> 59a3fde846d2196ab1e4588eb396012ba6860712..0be2f9119e78233928d23af86836ac294aa769ee 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> @@ -37,7 +37,10 @@ properties:
>>       maxItems: 20
>>
>>     memory-region:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: Firmware-loaded codec carveout
>> +      - description: IOMMU IOVA reservation region
> 
> So we discussed separately the pixel and non-pixel sub-nodes as well as 
> this basically alternate means of memory delination.
> 
> What I'd like is a clear statement
> 
> - Committing to this scheme for existing platforms
> - Adding the pixel and sub-pixel to the shared
> - Backporting at least one method to -stable
> 
> For that reason this extension should at a minimum be its own commit 
> with a well articulated commit log.
> 
> Since this is minItems: 1 it is conceviable to land both this and the 
> sub-node into the same file.
> 
> But my continued feedback and objection is not being clear about what's 
> being done and having two separate methods without a clear roadmap.
> 
> You have your sub-node RFC and this change - I won't say sneaking in 
> here but, its a surreptitious change as given as-is.
> 
> - Which method
> - Both ? Then what goes to -stable
> 
> We also discussed offline the fact that right-now the lack of a means of 
> addressing this in upstream means we are in effect leaving a known 
> critical bug open to the vagaries of IOVA allocation @ runtime across 
> every single venus and iris there is.
> 
> So to me minItems: 1 for -stable _in_this_kernel_cycle_ is warranted.
> 
> ---
> bod

Just thinking about our conversation on this topic..

Truth be told, I don't think any new features should be merged to venus 
or iris until this gets a resolution applicable to -stable. Its just not 
kosher to pretend everything is fine and keep merging new features with 
a known critical error festering unaddressed. Fixes: yes, other stuff no.

Bug fixes > New features many times over.

This absolutely has to go to the top of the queue, its going on for 
months unresolved - what use is a new video codec to a user on a system 
where we can mess up the IOVA/SID mappings and trigger a hard reset ? 
Its not just that its a bug, its that its a system resetting bug.

I'm going to have to insist.

---
bod
