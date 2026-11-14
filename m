Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626909;
	b=uu7fGgJvvCvjuRtrxgEjYeIaBiJCoi5RI92j2PuYOZ07pHJpmCZbANhR8x2d5gua+L7c
	 5qJBp60wGondLHqdbvyA0tDlDG5rb940YPpAGT/l0SHWY01CXFz05OA1KMmLb0AV0k0Lm
	 sR9PHrgdz9Qc77DRhRzClqPJW16bJZbMsgzpIKMwsn+a4wLfBtAc6Q6ctIuGtzWRbWdgV
	 2Pomh5aDBuSxx7OmGMgWSxUBIDqcGMreapE1Lzz9XbFtxlbJsE7ET8pVg9evRfbUukk46
	 SWfMZSX8X7xk4merAAOWyNFmg1CrgINCcs/IKdjDeKxeTP3GmUsIev96GFPwMzO6P/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626909;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=wIuWcCVlXcl7KuQsczCK+87CHD5CbGeZw8l+Axwbu1U=;
	b=giJJEbLCINWHEyMMR7RSkno+jXKaDlfgiMi4vjYl/wq5TTOJiRpdtKHiBAf47AzCB0r6
	 jMr//D4CZub0XpYIAv1yGgWAEZCZCRPAO2tRxQiJ9l/EzIssMdu4rKNKlneQW1kHI5lV/
	 j7ZuoDp2j7OwwG786m5aKEWwN6helVXkS9/Cyj5OgShLpXGbdz5+NwXynSQG+F5dHJi6w
	 C2M8FQQogt1yZagdoLLgII6b/cSg/o6N6S9WapwWF8WtBCZe01uBMw6Ih1EmEgrjMStRW
	 4S30siSrZmuegRXAkLLa3f5Nfw2AsLXPBqmmhATYPuooQXvW8u7UV4dFh7dGaMNC8uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="A/uA7fzl";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C169D606A89A
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C169D606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=A/uA7fzl
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so891540a91.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626903; x=1795231703;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wIuWcCVlXcl7KuQsczCK+87CHD5CbGeZw8l+Axwbu1U=;
        b=17xCiE9zyVVdGLJdxevCvY+F1RZM/XYmm0zAmT7OTkS/rz2ZVHBBz6pQIYOOGCsb80
         y8FYVvLMVIjy5u2M2e1vadU47w/nyfhaT5EIgOJC8JXRrtXp0QQvo1eXM2dkFcTFEMfu
         lc23OvgP1uwQsEwAfJNclI+mIy11SpzUJAaxwMHhHQM3LDay0Y5VlMc7nnjAtltCH9f5
         TCjMxEWY/wz/UOdW3OzDIl6avWQY31nGqLgcU9H7ULtgnQMP49jTeS6pkWFfCNIpaEG2
         lCcBaxJYosVrvF7cP8RhkdGtx96QeK2UYF5R1MZ+Db3aATrtAaFkJ5IaQUoqD2B1uTyc
         VOlQ==
X-Forwarded-Encrypted: i=1; AL+hErFYklNT6n9SWwWSuiGDLPniuNMqo/hIgKbc7xxfcmbvpP2srMm+3UuNSgQ4NcKXpRdCXssqrPLLtukejA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GDteulhRW6W9w8xbV3HW+iiM6U87MK5Sm72pjVAEnsl+do7BQ
	BiDO8tHGkQTCXkjBHxeRf1ASwQShJj54e8hiR+RAVu1FKH9AS/qt/lqxx2hv6J7wZWcWfbx0txX
	MBSatpb7LOKNyx+YIqUAIxckS4LEttc4TigYn8Qvf+4p1wVXEXsUNmK2yyXgiFrsn77OTrkrq+K
	jNheELJ0pc3/hSwVzhyA5EefQu9lSGxgN2rVKs2bfJp2SCTOilQk6H90FdapyG+6oZib01XVXDH
	pTEbuAS0p89eLIID2lcxto=
X-Gm-Gg: AYBFou13lnBM4UP2spzWBp26/rIdb1xBEgIUXwHR5nxydOqvRwdyXrxsdbKy0nstbXe
	pQa/td3yhRGV+IZvWu9r2+ACpfI4zsUM2D5imVALhJ8kxpc3Hsmt4AgQolRXQNs6qWcGtfvTbBY
	z9NyH+HEVAd27lNu6uda2b5bMiJwyO4H00BQGf4+OrueYwFlShMXi8ojvS/Jf4pu6gjBJlbfpCb
	wJARbIoQe7r0MahXquTVkeiRtcS1/v9r/q4ENccdFA5sI9keUMOvwAIoygh6npBTgXE6StiIe1E
	2tc9H6l3Rv4c/6EenlCd8vqNzcHCbuGAnkm+CHlwhtb4D4CD/zLHI3zaVdHrCGgpDOiKaeNUYFE
	QzXAzBErg6Tdzp8sIeVbxTo9FQYT5IBcqfcLZv6/7Hn6SCGAiP1sNAnH+7Ic6NJGVDzO+3bVJBb
	xHhkcD4TfEoV3Zg/lWQoAIX/LBEvq46XUxzSBeBtO3nms=
X-Received: by 2002:a17:90b:1d46:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3b1b0a4dd29mr4385152a91.39.1794626902937;
        Fri, 13 Nov 2026 19:28:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae999e55sm5675268a91.7.2026.11.13.19.28.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so2071376eec.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626901; x=1795231701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIuWcCVlXcl7KuQsczCK+87CHD5CbGeZw8l+Axwbu1U=;
        b=A/uA7fzlk/A4Had23/sq+ol+TDZ5Q3hbe1ufB3nBWTSuNZdFFDZeySdsmUvRhexV9f
         7kT7toh6w4Ux1WGrsfiB2ArNMYvleGcV2rko/pEPQpfxHsMxQ6xB/Wic89nGsjLwE8De
         193HFQ6drxr6a3FOyhICv0F5sabpkevk8wfZU=
X-Forwarded-Encrypted: i=1; AL+hErFwubXCFfjBIvz3O1zFQa8QrpUWSSzL0U2oSdf4oz6uCpm1Z9AyrIVjwVMvFJAP8wLuW49gOswObrTr+g==@vger.kernel.org
X-Received: by 2002:a05:7300:cc82:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-379681c811dmr4392580eec.26.1794626900935;
        Fri, 13 Nov 2026 19:28:20 -0800 (PST)
X-Received: by 2002:a05:7300:cc82:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-379681c811dmr4392538eec.26.1794626900216;
        Fri, 13 Nov 2026 19:28:20 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm11415865eec.12.2026.11.13.19.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:19 -0800 (PST)
Message-ID: <fbf90cda-d622-4cb6-b576-9576800534fa@broadcom.com>
Date: Fri, 13 Nov 2026 19:28:16 -0800
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
Subject: Re: [PATCH v5 01/11] platform/raspberrypi: vchiq-mmal: Reset
 buffers_with_vpu on port_enable
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
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 stable@vger.kernel.org
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
 <20261112-b4-vc-sm-cma-v5-1-d25e3b687e71@ideasonboard.com>
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-1-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/12/2026 3:17 AM, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Should we go through the timeout failure case with port_disable
> not returning all buffers for whatever reason, the
> buffers_with_vpu counter gets left at a non-zero value, which
> will cause reference counting issues should the instance be
> reused.
> 
> Reset the count when the port is enabled again, but before
> any buffers have been sent to the VPU.
> 
> Fixes: 70ec64ccdaac ("staging: bcm2835-camera: Ensure all buffers are returned on disable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian

