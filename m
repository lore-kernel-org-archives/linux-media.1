Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626919;
	b=MXoWm4ndWiPg98eRLmO9M1+xYOMWfwr0LuFDfO/7rsMRUMvUnnNTRJx50VVNW3Sye/0e
	 0I/RJDmXC0GwYrbbYexBIG3Z88Dj40CRDqe8QegTSAqm5eTzkyArXCOV0dljioDno+CtA
	 Zr/71Nd10b8IHXCHEKZYGUHIxQEzsBIL8379uF1aJUz9FTp/i8VT2M0Pl2cvJuE6XxctQ
	 TnxRWbdoa4dC6L2Tjj7OHQLmwTjhTGHGA1eG2AgIZHndwKkMcQPpfh34J5kEkSK9EjTbZ
	 JmIrDKTb2DC9mSU/iNC8EuG6BEbauG4SXhj9/bPhsIGZaPhs/bR16snqamijscGb2qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626919;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=0aFiTUHaLTX8K/bOcttDkw3JirpRVRPGu7AleeYbx/A=;
	b=Xncbl8Mb+Hk6Qi2kEdCFIcGpOADKwvZIXxQN7t8oAY5A52M1IroPr2L+xfITmX2a29uu
	 soaY503wtUZyKEZOD4wdk2beiOpYgEWQywieUw67j2U9V4+Q7T6jegnxrIXjw+PB2FAt+
	 uSMyJ4lIeIWYuh8EXS/ppfMQDqC70BBKFayr9PexnHWHOGHyBRNc/c1vLI1cL8RR0Ef4Z
	 noE3KvoJ9eyMqdHdI12mqxHCsB7XDhGW4E7UXMOYF7uTgZm6kiLTTAqzCdLvaem3n+a5E
	 mxnG1LWi03KDV+XCTcsZRilJWCVdK00m09EJ1WbU+nJlBd/nJ2kgJ4JRG0O5yma6uRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HHTW2NCS;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44662606A890
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44662606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HHTW2NCS
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1349574a91.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626916; x=1795231716;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0aFiTUHaLTX8K/bOcttDkw3JirpRVRPGu7AleeYbx/A=;
        b=zZd/xeytcy7S8lqW5W+izz2rUG4X0ahwjJoAhsCNPMUPw84IoLq3syY8LAZQ0vON0r
         SU7OyiiHpDf5C593YVnNSDMEvkMGXWI1eb1gWqKruLUwinO1ZTclY8pPOkvGSO30mONj
         ohwxNhxgsdmtpzjkBIy+SztGyyjTbD3jTs7axI7FSbbHvj2gm0btSdglHXvVgVIHhn40
         f+l5j8ET3Hr0tjcTMe+BJIoESo7Yo5XHCCdERoFloAPhJTHWKTilLmKxnB6ul4zDp7LH
         1lfNUc6IR6OjU0Kb4wTfo1PUvRLwmHLGoxDGCz9OaFWpvkhPrbvidzLj0jWxFleYhTG5
         yEfw==
X-Forwarded-Encrypted: i=1; AL+hErFgZZ9cqJ+ZZ8uj8cHdZCxZ+FVIsvOlk0CnIiCctYaE6bKKPl40cH9fJENjT0rJVpa3PDH8kRWabNjQ7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9nzi7KP1AnHues4bpwVFFhEkVCFqQ61Ts6EDHdrui3tkibi8Qb
	PMFKkxcWtf5YDVvORErkdQ9tlhbGhBbNE5i9w8ar8evET7raxXiKTM87Gi9PF6Md4x1QMPHWwYH
	vToZdEpIIRXaIMB3Aw9y0U7O/j4snMh8WtrQFvEjrI1fF2/T7deMCsFEWu/av5mSNGmclWFDZRN
	5vI8rS9vYnJmTZRKKH9n4FsgHeI3eW9ZEgGBv0XM897xYkhhsJM8/zRGR1AMS3xr1fQtipbuvnC
	vsF3BNqWJ1p242i7oySjsk=
X-Gm-Gg: AYBFou1DPmJDH0i3/3ZkXLlmoLCGNfbGVKDWrPeAfr6J+020DLR0vLOGqfDSOF+xBoP
	9bM0TIqG3iu53fkdkjZNnBtvCHz+zI+yWVDLHoflfZbO0aUIgLyhFZEZpeSsO7DjtI10aPnsmBR
	uQmB0j2OnNVxc30jfKALzNrfaxUOu3XOX4dOmfqvFiN6SPe0I4Eh9SnIQoz+zpe9u2U5DKoue/+
	a4K03AomysSAKe0O5euxpSPOPcXLf8+OoPjJfKfPmhVtQTLxOU5qFtwWl1vNsxybNaPNUX90h5F
	eL7MhRMu1N+q50XZCs19qkdEDb9mi2pL9R0/fLk4AD/eHzRpbhGgGnEqYYg655ffYqLrw0fBX/0
	kFRMYeeFsABV3l2VK7EgCNwewYtrJCZ1toIwaAx20k6ViSuzfY+jC+GnRwEsatR7F5KWCXwsIiN
	mrjtOhBVQJj3QTR9MZTU56tnPT2avG3SJLSVOJQFYJ
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr3743492a91.52.1794626916399;
        Fri, 13 Nov 2026 19:28:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3af131bsm1718217a91.2.2026.11.13.19.28.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso3801921eec.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626914; x=1795231714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aFiTUHaLTX8K/bOcttDkw3JirpRVRPGu7AleeYbx/A=;
        b=HHTW2NCSYd6mZpdRblwRPNGaZqpLzXept186dMoenx9TsxKrupMqDKUCKAYhWjRFbm
         7T6esF2TJbfiDoX8k3ZsiRp6cWiL4rj7mcJ7x6TiPX2BjgGkr7TuRvyfUzhn1naYBBLV
         5nQQP+WgTZPsK4j9G7eqEcrRTr+Y5OwjVFplU=
X-Forwarded-Encrypted: i=1; AL+hErGYH2QJQPfMPq9t/5XpnY/2QyLvABG8GGcUTW3YaHpjYsulHHo3q94Z0cIm5XyUhwns9899/BcCks5H0A==@vger.kernel.org
X-Received: by 2002:a05:7301:4d16:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-379675feb32mr4186725eec.29.1794626914286;
        Fri, 13 Nov 2026 19:28:34 -0800 (PST)
X-Received: by 2002:a05:7301:4d16:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-379675feb32mr4186687eec.29.1794626913548;
        Fri, 13 Nov 2026 19:28:33 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm19491820eec.8.2026.11.13.19.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:32 -0800 (PST)
Message-ID: <ae30799e-e027-4664-863d-aa0ebeeb05ff@broadcom.com>
Date: Fri, 13 Nov 2026 19:28:31 -0800
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
Subject: Re: [PATCH v5 02/11] platform/raspberrypi: vchiq: Store audio device
 in driver management struct
To: Jai Luthra <jai.luthra@ideasonboard.com>, Stefan Wahren
 <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
 <20261112-b4-vc-sm-cma-v5-2-d25e3b687e71@ideasonboard.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261112-b4-vc-sm-cma-v5-2-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/12/2026 3:18 AM, Jai Luthra wrote:
> The VCHIQ firmware devices are not discoverable, so they must be tracked
> manually by the driver. Previously, the bcm2835 audio device was stored
> in a static global pointer.
> 
> Move the audio device pointer into struct vchiq_drv_mgmt instead, so it
> is properly associated with the driver instance and lifecycle. This
> avoids global state and makes device registration and removal follow the
> platform device more cleanly.
> 
> No functional change intended.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian

