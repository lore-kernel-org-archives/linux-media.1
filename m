Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F30B3C2BB0;
	Wed, 29 Jul 2026 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319864; cv=none; b=XCvu+nXn0aNyF4ba+pKzuv3Tz4K9SfgkBRLv9P1atlwGZh1wpq2QJhsGf+OP6JqQ8wG/XQYazUmMHwQ4zMHZlxmAFvfFxhVW0V1lXydBGV01+82lNBDkyaWkRFPht+fP9w5q8cH8hqNkMcQqw3XMX0m28gEiMONjLT9k6VxQTyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319864; c=relaxed/simple;
	bh=b2v+YaE6nv1aMga9k3xauOnYR6TA+lC9uby7PrsmzmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOvWGk0I6Jm72VpY75OAqgdGKj6Seqj+W37wsJAPNImY/tLAyAPABrffYxeQFk2N9KyjZq4l/94gVh/dugkw0zENUF2sa2xdejIyGjPi+c4E+TcQRK4J8k/FbUOATjsc94mI7tO48fG/V9uxSUYIE0aSHeLhEi2bb2JaHAmf0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlqVzRvk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlqVzRvk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6012A1F000E9;
	Wed, 29 Jul 2026 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319863;
	bh=gpEM1giuOjXURuyUiQ5sHXw2Jpg9fbLoQpv9NJUkXeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KlqVzRvkTOLiJ3dD93dPJwP/029QEgKGt8TaLcutoa6xPb1OMMTPg54ctSHRzXFlW
	 j71F4UIGJiqzw7nKPql9JPiBuHK/2OcgFaGpMbLZGjej0Pt5exaLes7ZqugymWTwNk
	 hI7d7aNofik82JKvBDeGUHFrEj+s97d/UPjsrcs8JAkP5QO9aTb33wCdj5UzbM+WNc
	 WIaW12IfuYH4dLTSkjpNaFh4Xg+MHbLhxmBoXSJFCodBqPkkcAh4+o4mIfaRJWPNlH
	 ZE1p1sm7QJDFLkJOT6ckN94Sr67zvnHrs/Eg0r/EIpAHJ7AfRvocovmyV2iCh0xYHX
	 qJddT1r6D9BoQ==
Message-ID: <2b0ea2a2-c3ef-4147-801b-af41733fba7b@kernel.org>
Date: Wed, 29 Jul 2026 12:10:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <63t_fLehIKEom4-JPN9kAGFEjUG4_yFoHMhB2aEAppwPHb2oPbK666eGkGgXxEAHRJnfTRRUwuf2EqNRYe_gjA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
 <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
 <00df448b-b492-4c85-bba9-84753825c265@oss.qualcomm.com>
 <3128bff0-98a6-44d7-a390-27537e74e9fc@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <3128bff0-98a6-44d7-a390-27537e74e9fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/07/2026 11:07, Vikash Garodia wrote:
> Hi Krzysztof,
> 
> On 7/13/2026 11:32 AM, Vikash Garodia wrote:
>>
>> On 7/12/2026 5:49 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jul 10, 2026 at 11:46:58PM +0100, Bryan O'Donoghue wrote:
>>>> On 09/07/2026 13:35, Vikash Garodia wrote:
>>>>> The Iris VPU has separate streams with different IOVA constraints. The
>>>>> non-pixel stream must be limited to the 0-600 MB IOVA range, while the
>>>>> pixel stream can use the full IOVA space.
>>>>
>>>>
>>>>> Using a single set of IOMMU entries for the Iris node does not describe
>>>>> these per-stream limits and can allow accesses outside the supported
>>>>> range, which may lead to device crashes. One such issue was reported 
>>>>> at:
>>>>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>>>>
>>>>> Add non-pixel and pixel child nodes, move each stream ID to its
>>>>> corresponding child node, and add a reserved IOVA range for the
>>>>> non-pixel stream.
>>>>>
>>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> The thing of it is, this _is_ a bugfix - perhaps its not one that can be
>>>> backported, actually scratch that, this isn't possible to land in - 
>>>> stable
>>>> realistically.
>>>>
>>>> So what is needed here is a strategy for fixing -stable.
>>>
>>> I think, we need to start with defining, which platforms are affected.
>>> sm8150+? SM8250+? SDM845+? MSM8996+?
>>
>> All platforms, including venus.
>>
>>>
>>>>
>>>> That could be apply Daniel's patch and backport it with Fixes: - with
>>>> mainline then say applying this change and reverting Daniel's patch
>>>>
>>>> or
>>>>
>>>> That could mean some other solution for -stable - up for debate - 
>>>> what's not
>>>> up for debate is this series needs to _address_ what happens to 
>>>> stable for
>>>> all of the target platforms - and then transition mainline to the new 
>>>> and
>>>> shiny way.
>>>>
>>>> That could mean
>>>>
>>>> - Applying Daniel's fix with Fixes: and cc-stable
>>>> - That patch needs to be extended to _each_ Iris platform containing
>>>>    this bug... all of them I think.
>>>> - Updating bindings
>>>> - Updating DT with new method simultaneously reverting Daniel's fix
>>>>
>>
>> Ack. The proposal seems a good way to me addressing stable, i can work 
>> towards this.
>>
>> Will wait for couple of days if there are any alternate suggestion on this.
>>
> 
> I would like to seek you suggestion on handling for the -stable branch.
> The approach proposed here is;
> 
> 1. Pick the workaround from Daniel, and mark it as Fixes: and cc-stable. 
> I have the series ready to post considering for all _iris_ platforms.
> 
> 2. Update the bindings with subnode, and at the same time, *reverting* 
> Daniel's fix on mainline.
> 
> This is due to the fact that #2 might not be easy to apply to all stable 
> branches, #1 would serve as workaround to fix the bug in --stable trees.
> 
> Please suggest if this is fine with you or any other way you would like 
> me to pursue.

Sorry guys, but the logic here is not correct. We do not develop
mainline kernel in a way that satisfies backports. IOW, we do not
organize the commit history in any other way than the mainline
development purpose.

Whatever you try to do, add some semi-correct fixes, then revert them so
backport will work, all this is just wrong.

There is NO DISCUSSION about stable here at all. None.

Best regards,
Krzysztof
