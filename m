Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288244;
	b=zfML4xDIWrHsVzKYEplk7I9x6g628uj/g4E4SBpSjoa5xsMszcV2vtyNEuEHCjDhzgsB
	 DpIPG6iU096PacjCBmjWElf0ii8tSIuadLYgUdcdKBrQfcSoGy3U7Ri9USvwVSE7+nA75
	 ucm4IWXfxhAo597lP/xi2Jr1Gyn6HcX/BUuwXMuBp3kehH70Z1PvhZb+hUTf5j3PW7Cli
	 Gy1UF0XYB6dBVD+yA7IHNSl3mU+eFhBJDibNNKieH9B2Sp8f+jOBh2J/0CpXQ4/6Ng9dK
	 17mwj2UsjEIOxAqVMr+0BwmV02p0ntemlbTOglAUZpgSUqa/8J5ISvEl0Xg2ITZnJjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
	b=hWeOEjlcvKHlpr3eZZqOfLXXq6w0/F/jM9c96ytfG5ueiA1JAwndihjjKi9q+rGngdwq
	 8guUrCmzejDOd8qiUbohetWwbMo0dicfLVzGjv+sG6tq/tq6YqNxW12aPEnTNkJsrR0m+
	 EuCObg7SMl3ENNz37vPYFFKMDqzaI8kX0pE2t6KXLmbil78lwJaKfM5mcexCtXiH/pOG/
	 dHKp9xbIuz8IVkNtGI1BYn6ieQxvgmIMA85TsddsCtZdFPZHvmPP8SIJQjBDtCCql7jXB
	 PMq+KKBTpdoMGWZR6GnXSirt9sEZSy8RO96Obq+6Fy6k7ZUQZDrxupcDizhFblCsbsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBJufFj1;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88EB606A32C
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 19:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88EB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBJufFj1
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55c38cdd5b7so1135471cf.2
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 11:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288243; x=1795893043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
        b=hBJufFj1Qm0MTosVUdix7CYrg67j4sFwqQyFeUWyKL4F+kVtC07PIqIXq9JSi1b3wh
         /SxqneO5ezTSU4dS5sJZmxsCesQ2MNcfN+fbVZwodKRErXx4tPyNfcNTBdvC8kF0EDjh
         kRXy1NC4XQbhXeZeGiSOq9X/hJp5jx3uoMv/b9kSgmq4DlwhTFJhEq8MwsvoM9hvLkD/
         AOJstP5SehIESYaP/IaV0+ZP0TibC6BN/gynE4O3BdgwCuQ3jA+MmJNl7UxWe3f/Z6zO
         As7O22AnCezZKZ2wHYOvjJDAij/CM0gYuzNitfSjb9RhWwES1spSjOXnMST009P1fur1
         vmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288243; x=1795893043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
        b=DJX3hXHzvMqmtKElU7+z4pkGQwLWBGTKshBA/k+Dt9xkqYQijJ+w/xgNZx7GAD2dda
         M6T7Njfsm0xbqvP2Job1mwbe7xMNafljmxQY/RyO2QIQTQVME7OIIZ/Dn+ELHFcscY1y
         +T8E9doIxuwrx0m/E+Pz7RrMV4jT/su5zg5ltIiJ0lSAvLUMLbN2Bj1k+Covn6G/E0YS
         TNx63UE795JzPHZgF11RpKwGbfyjXpWrAlZD65LQe14Wwvd3l7kSKck7vSon5KUWpGZe
         RmG0dqrxsYZpS+RiGaRRD650RHZZC6XeI3J5CKUfBfM7ZREvcJKl6rFOg2gEcyUKD9lA
         zMwA==
X-Forwarded-Encrypted: i=1; AL+hErGCv1NcdPgryVeQwLNDcwlA0gVbaXxqiX3iUypUp1dFdXRGyHD1sMXJqwCQI6YbylBcX230Rk9rMjJ2nA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wSCfCjExEOa9aSlDxCP0/dCsoN3gCkLTax6aEXHG16j5RE4Lw
	lZeCnCttr1QHEXWFTpcSZjy2GHpsSpSEW0ixSgwiGFQIJ+rMaVJZdL/d
X-Gm-Gg: AZFdTZdwzSPTna72YtegLVFRm9lAEnlqTjRdC74VtLxMOrc4w1Dka15Q4hBFahbiMnN
	PzJWfqFn7n592tLqVjY1Qhip7kDmDlB4ZeAScTgY5BBMq8s6NiXNV+d4P05sYCL5vQDqEjP7ZXU
	z3LtB37b4sspjsfK7GQIpFggyjbnv95PkWW7Qj4oybjf4C70OdQFjP0vVYww77/FEwRu34fH4ML
	ZvWkDL4FRlF3N1vRSoj22Ngf5hi8TFC/sWu4QxANzW4Gdv7WhfWswnsXR3yvAapRJwTpXdDESUR
	SZlhJ3D4W3q23MOla/ShzjjXIpaAicC6U5aw7P1F5QvRO+k1IgR/gBvuhnPu1UywO4xF8YtwDOw
	rXOJIK2nZh2gUyxAl8lM1FfIzOthYRS9E//Qc9IB4JP3XEGY38sJx3tJvplv+0gaSgxjVVMRluo
	fXsNGH4srqh/fmQkdzbMmkPesANBzauBJ6EA01ENys6nNVE2KkEq8iO65z45AAK7ditkxj4Tv6t
	DEqtXNnzkQ2Q1ntNw2fLKoj7fi50OrdfHdg+d+NSneErxk+4B2TliUN3Aq0ik3BJ9eVvHQ3ZTZD
	qbMNRWlCDLvdLBOmz++DLzdm/Q1QVOAcK3w4ACYLZfapjZTgLPToPDG4x4vE7KKs/Glw6lw5Dqt
	OoVQSPZ8yjoEUCW0ZSOzONBP07w4udGfwyulqCnC1ctiGdKNSIpoX
X-Received: by 2002:ac8:5c95:0:b0:55c:8dc9:401c with SMTP id d75a77b69052e-55d76ade97dmr125384641cf.70.1795288242646;
        Sat, 21 Nov 2026 11:10:42 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm55854191cf.28.2026.11.21.11.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 11:10:42 -0800 (PST)
Message-ID: <af0d5840-f025-4791-b026-139e4e5f490b@gmail.com>
Date: Sat, 21 Nov 2026 14:10:41 -0500
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
Subject: Re: [PATCH v2 2/2] media: i2c: ov13858: Add device tree support
To: geocausa@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sergey Lebedev <lsa.uz@pm.me>,
 German Pablo Lindo <germanpapulindez@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
 <20261018-ov13858-x1e-v2-2-cd35434cfcfe@gmail.com>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261018-ov13858-x1e-v2-2-cd35434cfcfe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 5:10 PM, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> Add an OF match table for OV13858 and parse its firmware endpoint at
> probe time. Require a four-lane D-PHY endpoint and both link frequencies
> used by the existing sensor modes.

[...]

Hi George,

Tested on a Surface Pro 11 (X1P-64-100, LCD 5G) together with Sergey's
power v4 on a v7.3.4-based tree with out-of-tree CCI/CAMSS & camera DT
nodes.

The sensor binds via OF at cci0 bus 1 (0x10) on csiphy1 (4 lanes,
540/270 MHz) and streams 4224x3136 at ~30 fps via libcamera v0.7.2.

A few notes from the X1P/LCD SKU for a future SP11 DT supporting the
cameras:

- The rear module is mounted upside down on this device 
  (rotation = <180>)
- Routing and power sequencing match what you decoded for X1E/OLED:
  IR, rear, and front sensors all identify on cci0 bus 0, cci0 bus 1,
  cci1 bus 1.
- Rear VCM at 0x0c on cci0 bus 1 works with dw9719 as "donwoon,dw9800k"
  (vdd = L16B; focus_absolute shifts focus) but it only answers when
  the sensor's DOVDD (L6M) is up so dw9719 times out at boot unless we
  keep L6M on.

Tested-by: Haipeng Lin <jimmie.lin@gmail.com> # Surface Pro 11 (LCD 5G)

Thanks,
Haipeng
