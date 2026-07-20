Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C3E3B6BFA
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537645; cv=none; b=nY6eyBByZ1j52lHGlgVNwJlBSwD3FxhT6IY8yM5pt+xG/9u/zDQknf8VoGhql/g3sBUd1obomOUum2mn5f81xv3gFxy/lYCbMHjAMUu8QTKp8rpX9uAKPKA5uCKtXrGEU6ksOfR58VH5K+B5lKqqDVEgknjeZpwqYMf96s9Exx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537645; c=relaxed/simple;
	bh=ZyQZcq0mPTOKU5v2//FvoAr/q2BoYg80anwUr3T53CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjfISpSt39bnxWcj83nb2ar2eiyAsQtyuckdxqfylREICkqXMQj/fexniUFhThLBwPyr49aZdMpmll0NyLKy0nDF8iPhFG5R4CiTsUiAN69Fk5T7ET49d7nIIjtdL6Yb7JZkzMgmI/dL101/2bjj5Ggb9wItTqJy9AvKljn1X78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9LDvkBx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9LDvkBx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E641F000E9;
	Mon, 20 Jul 2026 08:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784537644;
	bh=0u2m1AQKWYxyboCzF48tI2DvuzQoXXu1SOAVjrULkmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i9LDvkBxjgaYkdpvqr4tfN7WiMA4DlY3rx6+S06zK+EfvkGK4tcS8Y+GKMZm7y88b
	 WTaf7leoyTI1KkVPoHY1ySgcPeqmNYQRk/Y8Vj81KroXVRulqI7A2sFnVrRV8OAjma
	 sTojxy6596RCY+YG8c5e2XURNS1B9gxFW9p74s3HOOCYOPXDSmAGHZNLRlHX6P7TP7
	 l5xHQTU8paqZq7Jiyyz1dm286gWSjYYL/KS3mNf1wTocBYjCnkgqCqb0I5GIBTX5v5
	 eqMoEJ1htgL9IHz8UNw3D73cgZOS1SNh09H7DDx9G3cpN5jRaTvW7xX+LbIW+EEx1J
	 hsTNIB847Aj8g==
Message-ID: <681bd27e-d58b-4b2f-b65d-49f3b2c01bc2@kernel.org>
Date: Mon, 20 Jul 2026 09:54:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: i2c: ov8856 : remove ACPI node bypass
 mechanism
To: "Yeh, Serin" <serin.yeh@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "Su, Jimmy" <jimmy.su@intel.com>, "Sapre, Sarang" <sarang.sapre@intel.com>
References: <BPkAfNBWv3FtV-5v-zRwnqX_ASShq9wG6NhI7ftYKii_3qF0KxcdaxS31MAkVKB7zlAUoLQQXAaef5p2Qpn4LA==@protonmail.internalid>
 <20260623084536.3400318-1-serin.yeh@intel.com>
 <d9b110be-a14b-4fbe-bf2d-036f3cd922a6@nxsw.ie>
 <nwsGXSUCUOLmR7tbtAgvOc3Cvog_0QqnFUI9jev6FLOxt0Cyf6D8gYfJT6XUWuvzYFvsYgGrp21TCTKGQ4Mm5w==@protonmail.internalid>
 <PH7PR11MB7962C4FE368856857E5D21CBF6C32@PH7PR11MB7962.namprd11.prod.outlook.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <PH7PR11MB7962C4FE368856857E5D21CBF6C32@PH7PR11MB7962.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/07/2026 06:53, Yeh, Serin wrote:
> Let me give the background. The sensor is enumerated via ACPI on an Intel host, and an INT3472 "discrete" companion device (the power-logic-control driver,
> drivers/platform/x86/intel/int3472) provides the sensor's power resources: it registers the reset/powerdown GPIOs and the regulator supply.
> These are therefore discoverable and usable through the standard gpiod /regulator lookups at probe time.
> 
> With the is_acpi_node() checks in place, ov8856_get_hwcfg() never requests the reset GPIO or the regulators, and ov8856_power_on()/_off() return early without running the power sequence.
> The sensor is then never actually powered/reset by the driver, so probe fails when the driver first talks to the chip (the chip-ID read in ov8856_identify_module()).
> Removing the checks makes the ACPI path run the same sequence as DT, after which the sensor probes and streams correctly.

Great description thank you.

Some kind of distilled version of this - less prose more bullet points 
should go into one of your commits or - the cover letter at least.

Otherwise LGTM, thanks for the detail.

---
bod
