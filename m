Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2E346AA99
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248400; cv=none; b=B4oxU1lJMqLJ0n+57WEhvYBc8kzCieif2yXfgV+oXiYoNXWzLjVQX3X8LNWepvR2TmtJOVjUoXLc2JXhVcEyo51m3oC3k+7Kd6StGtaWuDRJpklZKLj0P/JvY9UvMv5t0YXLJknd4LrbbnMuwPyMviUk/DY1PTAfjDR+eT3QY7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248400; c=relaxed/simple;
	bh=ehDE7RYYfCpdnswzW+7J85+kStX5HZj/6Uo3Dns6YP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3egYe+FeTNAUaAGFUlhqWX6+fC/TS5r3Zr2JZgTDutvULh0TfJrNJKcSzHLNgiXPcNQ4gnfcBDacivV1vKI8/SgtqNDS4XmUfK33SnGcxY6ZWs5PYkasoXsnaBFaZnknMwfbBbW31mUIXiHBC/Rp1jnQl9HVUC3D1XPgk8IYIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkN5XOxk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkN5XOxk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso30066435e9.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 00:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248397; x=1788853197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFV4yBSab23d+ZQcyN166yeywrzh3EvBwUi0GdjrM3I=;
        b=OkN5XOxkn178Mt+tc9zfovUharsZ9AP3Jv1pjQJTOH/WRYlDe9bblk/3371ipG+ksB
         xAldPxJpFFNUvNSVJ+rNZHKoqI8Pno/D/eF5Ya17OvWl49dawbRaU0UeSLe4bJmm6sQK
         9kyfe4qUxfdHE2oHexCEYCRF8tmoKuB/ybArYorgEuraIUkKw0Voab4MhdoHAvz+kqFx
         cWkOstEp4IfLoKfJ7mWiXvNAVM9RV+za7ArP5oC680G/yPFX1w7RELXikrdHlo+pNSVE
         sz3DhFoXjD+5SuKB6xNgvPXHtNHIY4K1uUZHiwbYEIAatL6YjAbRnyvopzR08JzC3LBi
         OBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248397; x=1788853197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aFV4yBSab23d+ZQcyN166yeywrzh3EvBwUi0GdjrM3I=;
        b=RuLetB5NymiyMBh3jC+PFrt8NhaJhM/xtxeL5kOwe2lxtj+Raee3r8qx4y2ZYVylk1
         7NQVwTF7p1lcadClTF6CJFlKIemKupOy6L/VLn316HvlHO/X+lq/jzB+1+qxA6RFRbv8
         vlRfD4amkqGpz+ssbDUzeIaxb6WdPrysmWVzm5vc1inKXmBBSKIPdp5zfKqQh0XjTIA4
         vDpnXwrM4zGwqbxzb5ZCgLHKF3666V61ZRsjYfL8NFDDWCXrY7sNZ734B42KN91a5jtk
         gx7KsTlG2nWvp+pH7Ut6GQ42wvxXdaj9EaWQK7tPfiwCrBqWXtp5cv8mVmFv9TssQFc+
         Pczw==
X-Forwarded-Encrypted: i=1; AHgh+Rom6HZc8e5ke5ICpnhlLXwKorVTbiG+V1waCqF4DxjwLW8l0A/1sKOCwv2la7oUEeWp9rWXo0OVn8q5tg==@vger.kernel.org
X-Gm-Message-State: AFuF++mhEEDjary9WDBHd9A/+5LauKwnqX4xFvkG+08Mp/zC1cv0WjnK
	XDTXlBxkOiciHGNCsgbT2A3cffGK3wSsS+biVPwrBn1h5FAs/nKRD0BR
X-Gm-Gg: AR+sD10djU+bB8hIQtR3+ZyYhFFVBFDsOCkHbNp28HwIm8n23vcDwRBWJbFVP1a7uFk
	Gh2zuBbHfHSCyBg6cOQTaBa/HEPkaEKf2gyZZm79FrTJSXkSozH7lQnm1sOFL3nf1dJ8iqYguGu
	P7jeABJ19lzC09pcTBgJKzZls+wFosedzLoZFi4zI7XMLs0LjDnx7aIPh55YIVCGqJrEPNrsIdK
	sWgrSV1TEn7bXn2q6sDJqTXZa4C/0ivQrrYnqsJFDd99N6AjX3QClYMRQray7m664GgHUIWF2tN
	/vOzBZdokNc0em9NlPQ/fTSxW2Ju1SSSFj8UHOUWAdu56oFRwQNkKVomL1Z04NIw/PrwuSBwFZT
	YUbkJMAcSKveHzTZILdLwqeQlUCfhktghdymLP2OwCRv9kmUQkkGZjeuGcEIkW4ZcVp5hqM0EPg
	KpYqmrrAksRtt0SrtUt2mz1/7OX6p3BsO0a8vC3hnWGmDRBSfJ5PKGzC1DqrMRgBg=
X-Received: by 2002:a05:600c:1906:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cdc555496mr97428045e9.15.1788248396295;
        Tue, 01 Sep 2026 00:39:56 -0700 (PDT)
Received: from [172.31.2.29] ([5.2.194.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1e1ebsm48703365e9.14.2026.09.01.00.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:39:55 -0700 (PDT)
Message-ID: <65b703e7-e4a0-4046-9d35-7d0ff1057f96@gmail.com>
Date: Tue, 1 Sep 2026 10:39:53 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org, Martin Hecht <Martin.Hecht@avnet.eu>,
 Andrian Suciu <Adrian.Suciu@analog.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831170303.GB1116206@ragnatech.se>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <20260831170303.GB1116206@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/31/26 8:03 PM, Niklas Söderlund wrote:
> Hello,
> 
> Thanks for  your continued effort pushing this work forward!
> 
> On 2026-08-31 16:21:19 +0300, Dumitru Ceclan via B4 Relay wrote:
>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>> replacing the few GMSL2 drivers already in upstream, and introducing a
>> common framework that can be used to implement such GMSL chips, which
>> avoids code duplication while also adding support for previously
>> unsupported features.
>>
>> While the normally acceptable and polite way would be to extend the
>> current mainline drivers, the choice was made here to add a totally new
>> set of drivers. The current drivers support only a small subset of the
>> possible features, and only a few devices, so the end result after
>> extending them would in any case be essentially fully rewritten, new
>> drivers.
>>
>> This series depends on support for internal pads, for which a patch has
>> been added.
> 
> It also depends on enabling the streams API right? At least I need to do 
> so to be able to use the TPG. Out of curiosity do you know the plan to 
> enable it by default upstream?
> 

I do not know when default enable is planned, but series could make it
so VIDEO_MAXIM_SERDES selection causes v4l2_subdev_enable_streams_api=1.
  I am not sure that such a hack would be acceptable by Sakari or
upstream in general.

>> The drivers have been tested on the following hardware combinations, 
>> but
>> further testing is welcome to ensure no / minimal breakage:
>> * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
>> * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219
>> * Raspberry Pi 5 + MAX96716A + 2xMAX96717 + 2xIMX219
>> * Raspberry Pi 5 + MAX96712 + 4xMAX96717 + 4xIMX219
>> * Raspberry Pi 5 + MAX96724 + 4xMAX96717 + 4xIMX219
>> * Raspberry Pi 5 + MAX96792A + 1xMAX96793 + 1xMAX96717 + 2xIMX219
>> * Raspberry Pi 5 + MAX96792A + 2xMAX96717 + 2xIMX219
>> * Renesas V4H + MAX96712 + 2xMAX96717 + 2xIMX219
> 
> I tested the TPG on Renesas V3U + MAX96712 and it works as just as good 
> or better then the staging driver this work makes obsolete.
> 
