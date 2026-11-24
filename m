Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515476;
	b=Z0Zhe0OBBYWJ+8Q56ENaGPKNy2VWQqXlEAoobYCc+gIfQdQALDYG/zOZhMsS/VMfX6+4
	 LJ1seRoIigYKvIPrDLaVvzgGhcuNbOwlABJkuT4bVX+y/RR0LDA/Pw1HZX5cQI9QQnWc6
	 KoYPIvSRwm6wgEvlVqewA5Umu01TM9xTSVaUul0YiFCL8hyvanwm6M26ini1VMPTAdJGq
	 q7nI3LNBGdUhBrb6pDc7AdZHmk5AxVo5xYBssnjRdAipSQV0+ekrrMbuELGsa46bJQzCv
	 L94gs736oF0QpfjvRNk1adpythYab2RX7mvH98Ts1+dOqo6MU/67tf7pqTQgL212tvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515476;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Eyx2nY/TjrlckLPEms1n4LDgV3zoAer+qbRszYJP9X0=;
	b=BkrauMzAOnYKjgBuouPifYKAyTnINx6h/fSa+9n6Djzxe29YcplAh/BiVhnyEyF1k5OC
	 S/XxMizUOSxn8skcTLxwNglLFIzCkroeJoAvtPMZc4vx0UYnKcKPssJhdOoOZGek0nPnh
	 sP4psu2oSs5IR1LeETV6dkkRQbQU2APrUsHQoWq5DU/J7Ah4LxPK8g96iwmuzjHkdF3mj
	 CnInBvgDxqQuTfS8Vkyh7+254MwAkOEcio+xMX49H0PNW78IhFbM1UTypAnT2NcqaKoDi
	 cp+G5ue+DlCXUEHkdT+wOWIaWTKqX48M0Wd1n04tEeO0qRt712z2r59Q/V8T+WJlEBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="Oi/Hrp5/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB7B606A688;
	Tue, 24 Nov 2026 10:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB7B606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Oi/Hrp5/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1769D339;
	Tue, 24 Nov 2026 02:17:52 -0800 (PST)
Received: from [10.2.201.43] (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A0263F632;
	Tue, 24 Nov 2026 02:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795515475; bh=63BZvrxsCI3tJV7cXt0Ms8121XqrEm8NAUIrxSh/3mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oi/Hrp5/YOjRQk4JPVM1LZc8hROBdkWFFAm81PT+G7ktnxkvFMpdtCNq1UxQoAY83
	 WXKkrVDynkQR58OKXhZGOMNvb/EeY384egKGmszKN7F4xXoHqYMH2lEWhew6Su/zlS
	 rq/Ln4j0qE51n9EFLLpOeTqYgfc2yH1G6jpUP/zg=
Message-ID: <fdabdd57-74f7-4be5-93a8-a6955d205791@arm.com>
Date: Tue, 24 Nov 2026 10:17:51 +0000
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
Content-Language: en-US
From: Charvi Mehta <charvi.mehta@arm.com>
In-Reply-To: <awAzFsX_VUbzTqK4@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/20/26 11:48, Uwe Kleine-König wrote:
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/errno.h>
>> +#include <linux/io.h>
>> +#include <linux/mod_devicetable.h>
> Please don't include <linux/mod_devicetable.h>.
>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
> <linux/platform_device.h> already provides of_device_id, so
> <linux/mod_devicetable.h> can just be dropped.
Thanks, I’ll drop the redundant include.


>> [...]
>> +static const struct of_device_id mali_vpu_dt_match[] = {
>> +	{
>> +		.compatible = "arm,mali-v76",
>> +		.data = &mali_vpu_v76_variant,
>> +	},
>> +	{},
> s/{},/{ }/
I’ll add the space, keeping the trailing comma for consistency with the 
other initializers in the driver.


Regards,
Charvi
