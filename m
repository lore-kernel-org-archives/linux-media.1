Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609352;
	b=2wDB33binETIZ/jnFcUZdsvJnJ0MJikwiHX2FPJTrjyGIAQIUyAoUCiUPP+Tx+HIzy+E
	 hIVkReUX6A02f5kGKLRBfLPKITqgJJI8WGD3x5jXGm14LZ2RXAdua0+fz0OE8iA0TM+RE
	 98Z+wf/vzaCAeuVP/iugjEJK2M/wCMIXJ/ACTLiocWPPvz0BLQPIG9mSXCztmIXkDoeIv
	 Tx9YhK7uHpM8JkS9HHkzxnaKFv/YmBPR11mvg2Jlg5MJ43uMok59+szAkOIU4hpNe7WZi
	 NaTHENnjM1hRbqiaNiaPSLAO06l6flhRzIxJCCwG3X0wh5mBIDF/iX2QbYhvuZt5h7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609352;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=I+d8sdCflfJLjmy6OD3jpz5BHxgF/9kgYaQAIeH9cdU=;
	b=o0IIgVHqdS8nQ/NtThaOA6a2cyGQ3pPsHpG12RYsEYTZVQRQPrdiGC9+uCZogDbI9TTD
	 0lM5xyWZJrcJaunrhFMCUbtPInllRXDY43M213ZDiVQx462JnDv9+x+/+RgoM2dRk0QJ0
	 ompFQqkHV13A+FGSA/W0EyFv26LTgum77owMMUBasQgrA3A+TEzhMcMXHkLVhRB0GyuqZ
	 0BqzBeErngEqN34IheN6belgajafl761GVAffvmqxI/XgPfOcnlCMvYF4NG/kPJF6vQdJ
	 0MxsM8qfrU2iQ0mnpJVtyXvXEVLC19FlY5UY6EMCGYsN761uqh4jzViJFGGX3erLmzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IlqmIuuU;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C993F606A327;
	Wed, 25 Nov 2026 12:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C993F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IlqmIuuU
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 083BE2F;
	Wed, 25 Nov 2026 04:22:28 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 616E53F86C;
	Wed, 25 Nov 2026 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795609350; bh=pPOkQs3NQ0a7jCDnHNBhbTwQuV5TYBuOzZxX+q60a/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IlqmIuuUNY0q+LG6WyRzHJvP2WuN1ykwPoB3LB8pdD/A+KQVZ16XI1sS1BmSVexk8
	 i6jyoyMfX+9a4XZIkvaITPHfoDZloPbuePYxcboEJSB7ku0PiipRSI8lt+aLohPJZz
	 U5wkMTGHdjzynqxhiGYqREoBAqO/Y6r+s93YyUzc=
Message-ID: <204b016b-8635-436f-aca6-0aa9d36394ae@arm.com>
Date: Wed, 25 Nov 2026 12:22:27 +0000
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
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
 Shobhit Pandey <shobhit.pandey@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-3-charvi.mehta@arm.com> <awAzFsX_VUbzTqK4@monoceros>
 <fdabdd57-74f7-4be5-93a8-a6955d205791@arm.com> <awWFan4TZChEmL4G@monoceros>
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <awWFan4TZChEmL4G@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/24/26 13:15, Uwe Kleine-König wrote:
>>>> [...]
>>>> +static const struct of_device_id mali_vpu_dt_match[] = {
>>>> +	{
>>>> +		.compatible = "arm,mali-v76",
>>>> +		.data = &mali_vpu_v76_variant,
>>>> +	},
>>>> +	{},
>>> s/{},/{ }/
>> I’ll add the space, keeping the trailing comma for consistency with the
>> other initializers in the driver.
> Which driver? With your full series applied this is the only list
> terminator below drivers/media/platform/arm. Note this is
> different from
>
> static struct platform_driver mali_vpu_driver = {
>          .probe = mali_vpu_probe,
>          .remove = mali_vpu_remove,
>          .driver = {
>                  .name = MALI_VPU_DRV_NAME,
>                  .of_match_table = mali_vpu_dt_match,
>          },
> };
>
> where the trailing , is right. My request to drop it only applies to
> arrays where the empty initializer signals the array's end.
>
> I don't find that documented in the coding style description, but with
> next-20261123 checked out:
>
> 	$ git ls-files drivers | xargs -n 1 perl -g -n -e 'print "$1\n" if m/device_id\s*[a-zA-Z_0-9]*\[\]\s*=\s*{(?:\s*{[^}]*},\s*({\s*(?:\s\/\*[^*]*\*\/)?},?))/' | sort | uniq -c
> 	      1 	}
> 	      1 {
> 	      6 {  }
> 	   1957 { }
> 	    405 { },
> 	    490 {}
> 	    576 {},
> 	      1 { /* end */},
> 	      2 { /* sentinel */}
> 	      1 { /* sentinel */},
>
> So arrays of type \*device_id[] typically end with the terminator having
> no trailing comma. (But honestly I'm surprised about nearly 1000
> trailing commas, I would have expected that to be much less common, and
> drivers/media/platform even has more terminators with a trailing comma
> than without. I'm embarrassed.)

I’ll use |{ }|without the trailing comma for the match-table terminator 
in v2.


Regards,
Charvi

