Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627007;
	b=miIpvoEjgNSgvYR9bva1gR7SRa1Ofz6XYS+Z5WPhxPfFZ7wgJ7S7EbqgyCCLV2QYLdiJ
	 lBeUzJLpbreVQ/xriZzuougbSkasggdfGLeeMVMAOqOzrd0HJn/7+/IZUetx9bonVr0iX
	 TUBryvhZ9haQAYI8Nr4cZevNMTP7KigUp2D4fmgjtM5KA4S4AFDn2ctYyL5bnMc+hsC6E
	 5JY/eB95tK2wi6zBI4yQ3eodBCgF8QUImzsHg56sihzKZCFJPjc/nGA3xe4PtEEmXNKQx
	 wAgD+4FBLvyeZBPpGlt4M/BHzpf7fGeHGx95sPq4rq1Zww/runjLfLU73nWuvvDtS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627007;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=5jsTRYk7KQN7825qF1InYK8P4ki41DeOjAFowmky3OA=;
	b=YLtHV0c5RzYHoxWQKP3ugCo4wMQIco3Mvabve1auNwaBHQWbM8cqmXyF8upB8VPdC39f
	 hKVUuZyU+n/8spRHYCE3WZxDcPEqUBtkQBgCMOrHxcv5b22oJA30a3VfUfI22jzIa6+Xe
	 IfaDtyR0ImG07H+p1Fiw+iGszlbx9w4ITSMd9CGDPVpIPgTQeYHyjHsi4hz3oNFoK/bX4
	 64HzVGvzDWxPI6ferX07VmTO25F1w6G/tGAuuO1sje7EfXr6ZdsBzIRWksrp7ufZVjygS
	 g0NqI1WosG9DEq+BdogbWQUPFm2t6x2BcJf5D5H7fUCtdhol8vkxvuYAGbHOtjzdWaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="GSi9Wg/e";
	arc=none smtp.remote-ip=209.85.210.225
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66217606A330
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66217606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GSi9Wg/e
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so717313b3a.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627004; x=1795231804;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5jsTRYk7KQN7825qF1InYK8P4ki41DeOjAFowmky3OA=;
        b=u4BU6q95kFtIgW9a8AQnZ8z3kohUTJB3ZOYUrsfVTpji6+Ly8J7Qi4/Ud86ESG2SF7
         fD1NUGSh2eQu/a9lTdVt0LgShQy5A2/Kgknv+4PSJjXYXps42Tcxq02QSQSOhdQuOWgH
         NVHpnirBhQGBUA9YepSrMP+6fqUDmDkD2+hrT5vn/0/9Xe0zYwC9v31CXUFa1nExxQZk
         xwFoNKKt0tO+hnkpg4uzIGY7eRN9NqxyOmnQ4SZ3DQoTW7/f+1TPn4jH4ZUTGhWHsiTD
         yBoHlpEZpwaYaodpTX2sDn2ZyT1JZN2Bismp23wIROSavPZtINzrkab3eO2W3RJuEyaR
         PD7Q==
X-Forwarded-Encrypted: i=1; AL+hErG+9er72l/fs1gb/iu5G4ce+vjt/roy7EbjQyJ9aphI7DRNJj0OrxG1QW0ghtswuF6/Ojs9ePcLgVra6Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+SfbnXZOU6GLSuJj0pDA5AwfOt5BN9q+zc6e05tTFu8eXXFq4E
	xPwdrvKfiVqm7/n1fSMCYE7kUpWQqkt7Z+Tj20XMKM4ea0f4toOfAY8hBpyhvDHZbf/XeCdCLt0
	771qEEVOUtiSFzLUG6i2HbMoKCDBEXmT7a2ys5oEI4RxPC+bcPoKOpNfJSmCSV5AyLffcbEH+MD
	fPal0jFnUOg6oC/s/DrFBh+c4JsAfVq9q0HgOGL0blGZXd8aEAStWOqnbK1mS9Q0/69SWpa+J7/
	kqRoQD+BHlSCet/XRUR5ig=
X-Gm-Gg: AYBFou2/HLlGgBU+mucdXY+qTiAW4aC8zGCiLwqJr7UEZk/5mm6JuKx3GH9WRsMEESR
	ZdFdGFZMLUUnTznIzGzw+S3MwKvw20uqfjA5cHpfbocinRfjQCVGuSMOONiZgqQX/6vzdk6apwN
	WN8dCs90hg1UzqU01mgC+wxBn51WIdvkIfAqJlRraDOg5Uofwc6UFKrPGCpgfB6UdCt5Gy2+mZ1
	+JAhZC1P41J1lJDVPFLl8gidhS3ArmOfFshFt/WISeT4gEEbcKucUDBM07WMHG9kJzSAQt0g2mC
	e+M04QiA5120EvEY3G6qezdc4f6BD1RgCihgQmK5qv/7UluG92dyFcwQ8S4VemsdcP+zdILCy0p
	rdAOep2X1bAEuz+uHTQJGh+yNXyjjatlAQT46qvHNh/snA+5OIQa0gYHv16BPbU/dacsD4lk1j0
	2SZG+2Im0nbn23BHoxSgXaaKyCgWogGhwxKnUmhsVxjjY=
X-Received: by 2002:a17:90b:39ab:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b1b0a0e894mr4442251a91.23.1794627003594;
        Fri, 13 Nov 2026 19:30:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b1ed0b73sm3135168a91.0.2026.11.13.19.30.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:30:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37549877380so2073411eec.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627002; x=1795231802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jsTRYk7KQN7825qF1InYK8P4ki41DeOjAFowmky3OA=;
        b=GSi9Wg/eaDTK7GTCf0xSDp4AGKt0+cDoP5VCEpOe1UrbVnJ9BvJhgjlDUCBbVS9rre
         McQtSQ7Dol5I591z9goDc7TyztA158qkEKFGuILHVzaibwG1ecgyW1iq1ePdV205sRTg
         wR8t6XHWvj2hpz5CpuHThRKfU6z1D/xdc/vG4=
X-Forwarded-Encrypted: i=1; AL+hErGIVUYOy2Efu1ngv8OhfYGxDaBhUzhT1imtPhpxBZaarpqsFm77ikoClKGEoBZ8PVAPq5dkYFVB5A5tbQ==@vger.kernel.org
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr3674705eec.30.1794627001857;
        Fri, 13 Nov 2026 19:30:01 -0800 (PST)
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr3674674eec.30.1794627001180;
        Fri, 13 Nov 2026 19:30:01 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11295736eec.16.2026.11.13.19.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:30:00 -0800 (PST)
Message-ID: <68e0e1d1-37e4-44c5-9830-dcfcbacde762@broadcom.com>
Date: Fri, 13 Nov 2026 19:29:58 -0800
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
Subject: Re: [PATCH v5 05/11] platform/raspberrypi: vchiq-mmal: Support
 sending data to MMAL ports
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
 <20261112-b4-vc-sm-cma-v5-5-d25e3b687e71@ideasonboard.com>
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-5-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/12/2026 3:18 AM, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Add the ability to send data to ports. This only supports
> zero copy mode as the required bulk transfer setup calls
> are not done.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian

