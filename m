Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626998;
	b=lj2J6DAHLNpDm0K1zlIkoAGDMFKL+fynjMA7/BZo7iBc8Qpri5bs8JAUGIUA7jJwwpjk
	 WRUdshdIDBoOXXo3awfLV4fTh6zWhDPo+OrpjA/OBXMBTDkGfRiRAJBFPjNuDqwyIdJLI
	 z9IFgn+P0l5edB3VnZ6CMnJTXevppIUXfmDo7EUeBThlM1lywI4102CMgVZn8mldBTpS2
	 FRALzTze9pvkZRRf2xchXqjgxbEfOSvIfxgsW3PLO4r70kH5eZ/esRlUh3X3dl6XJUn77
	 g0hVFhIP5JqGd4WFnueCl0tiZjSImVIz63rl3nHEowhvIjtzXzEVTfz1OYe0FYSO5VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626998;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=yDc8YbhTZN4Lkq1WU0z5LX1Q8KhtfkMstUTQ2p2A56Y=;
	b=WzdnpMXxiRrhX6oxyz8N5AXXGKoUTM/zpaGebnq30FXMNtZIwu2U0b1+KBsc5xHYRD2G
	 CqJGbdbicqyLDDjWRMXnWbqko/dAKJwwrF92k7eUbdIJ2qvYHHWBTBXW+Gdzm6Ky74Lc2
	 We+87uVVUbXEBkNeJ8ahi4mpkzMKIes6SUDcskvvNPB8w+b0/u6Z5PaMqPPvAMjlkNa91
	 qIT3bXSb3I34xHeDwinMdiAC4H70mwo4qowqEugDoEtcCzZ2W7B6fKmGD4+RW41Gsp3rb
	 iLCP8mjHECZUjTFeLNjkpdAHo0ycSoAm1cwwSM5tON9WzHC2gbjOM832K0g5eCbDlAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Yca2aPjf;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05662606A88E
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05662606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Yca2aPjf
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so1693956a91.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626996; x=1795231796;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yDc8YbhTZN4Lkq1WU0z5LX1Q8KhtfkMstUTQ2p2A56Y=;
        b=NIEc3qENtaBOP6P5bhKsENpmX9SYmWIyM3VkDfSAmJ/D1EM1lCmRciaCgLfa3urIVS
         YmfqVon6hI9o49ir9IN1wWxzFzuuzGmPKxEMCN2G3Vymbg8WBLy3y/se0IIb+Eb50HKN
         OXgkWu3td73qQ1MJeT2YwJpPmzdWNxGPK8kFRMLxE1gxpoQhpeVlYQdPG0bycqANsF3G
         uo+G7P3lufW3A9dGOUhitrRPKi5uBDs2stGYxYwOTWBdIxbxQei9hWhA09GCojuNAYmh
         m4ZRr/JohJYaYrnGRJAgLVUbR4PJTZGvmpN+kFk9auoYYloPfdOsuqFlktS4CSdFzFaf
         BKPA==
X-Forwarded-Encrypted: i=1; AL+hErFJ3b1auR1Is9CyK/JjNXB+d7ksoR7DNjY1Ia1yzNMm5a2SJDLm9wIBz3PmGW5y+MZP7bBpiYmMf9d07A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0vZ735PfzCZWu19yYHkHnAlrIGm3cARIpTwPOk8EXODF7Q0Z1
	juN1Cbt3++3p6Ga4qoLJXpKgJrBBZ9Rxfy5TMjmH3DR46TpCal0WKPLDF7TburAMvEUoKScikmr
	fdt5ribDRjYBv6ypXj03lS33z11iEAHLVcWYabjM+/C+tUiylaHShpUoRsgn0AgVkT1I1Cvh8DT
	AvKt+H1IHcSy92M0iTwV/X4YTVkxiS3QktGchykHdj3rysw8cK1tyIyaJuyXZQ8QGwxbvmGZ/n1
	rAru1vuCuU59vbUMLxQDUw=
X-Gm-Gg: AYBFou1mvlCvRk7Lavyaz19NV5vz56/Y3n3hdJM5wCKa6Jbu9tGB0osg0j/QAuEbJcl
	/mOvbWjqj++YAF6PzVyypKhVAY7wlhc9MrAfcT9l1LBAfhd0MhyH3G5XZjv37bbMymFw0RQSbr/
	/rVJt7wT590bgkDpZqF2uJZC/KjjDUoPpJ5uvYaG3f2KTDWQO1M82RO4tKgrLT4HggYSGghfo2K
	Zk3NJvIaaPpR6PBdKZR8owAYPUItMiw0Bmy80osVDwpn9eqW4VXSmcHxAgAOJZobjRtWQ/1Mg3b
	vLC18SevaaTGTdjGAN2g8jUZwgdAK7ZdIxUA2iliiCs79dBz54kdHKcWikQ7JS1T4YNEarRA41v
	HSjKMY8S7Iq3uKG2Xmt88UuVu+NAgbc5BTVxZsMuRpH+f57vcbush3SVxoEIiv2Bi061ke1Nhv2
	6C0q0tvD9SPIZEQA4FVF8U8l3GcgubeTWqdrZoQav5
X-Received: by 2002:a17:90a:e7c9:b0:3b0:ce1d:3398 with SMTP id 98e67ed59e1d1-3b1b09f3b5bmr4565843a91.18.1794626996070;
        Fri, 13 Nov 2026 19:29:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b1ed0b73sm3135003a91.0.2026.11.13.19.29.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:29:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so2320593eec.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626994; x=1795231794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDc8YbhTZN4Lkq1WU0z5LX1Q8KhtfkMstUTQ2p2A56Y=;
        b=Yca2aPjfk/ar034vorcRiuX4Vses2RVzsd9MStmYGj1f3Lw0vl/9aAnzySZgW8699A
         S4nPidNpz6uzz28bEZpszlRt8kVxQwhi+lnzVa6dlEyPng1mDfziK8r4+1UIbfxObD/a
         Lev2Dyw94NqzvllDcicApQQpDJdJip6/4qeA0=
X-Forwarded-Encrypted: i=1; AL+hErFLCeumU/PE09gBGaLyqH/NthDNkRjdZoGT2N1g/FXfs2fCVNHDUCCJcJHZ26QxfzTXQ4TYM+eInpP5xA==@vger.kernel.org
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr3676489eec.25.1794626994165;
        Fri, 13 Nov 2026 19:29:54 -0800 (PST)
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr3676459eec.25.1794626993492;
        Fri, 13 Nov 2026 19:29:53 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11295736eec.16.2026.11.13.19.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:29:52 -0800 (PST)
Message-ID: <beae6d07-e25d-45ba-bcf0-39422feb3295@broadcom.com>
Date: Fri, 13 Nov 2026 19:29:49 -0800
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
Subject: Re: [PATCH v5 04/11] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma
 to support zero copy
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
 <20261112-b4-vc-sm-cma-v5-4-d25e3b687e71@ideasonboard.com>
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-4-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/12/2026 3:18 AM, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> With the vc-sm-cma driver we can support zero copy of buffers between
> the kernel and VPU. Add this support to mmal-vchiq.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian

