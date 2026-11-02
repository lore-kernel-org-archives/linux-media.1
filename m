Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656869;
	b=S4XosqyrXapiTCfj4jDeZDc4NJk85DEhRr9YB7fHb8+qdzFeLNtnghoTxec6d61fPsxy
	 PgS/t668NP6zAgzg9hTrjSAuh5krSnq37UDpKvH15CwFdK42/WrLLbLprA1zDOT2Qq+Kd
	 uVkFH7jgf9z696+m8Q/+ecF17fsMiLcgGfmv77+zxbtKwOWScmy9GrFkb14thKOGieRK1
	 KvbPxqlmYtIjpn6/vjPskfVdUQu7W7G/poJoKRVkugd0gjn/kL5+8ZbVZClZ5ieubIGt1
	 6HBu5mjHOwPBN9OVYtr1jt1OPoPTLoNCzE30ZirxEGEglZTdyngh/y1G0KTSuc/vEag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656869;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
	b=yvF7xhiOeQE2RibSngvUTRKEqrMBWIU7g3V0vgaQ11dIOPgo5HYo0hblOz7AgbDMlITP
	 aKt3KfZ4xV6QmXFzBEf5+T9fJujnQcJ5Y90vZIBafjKshfG+em+zkKJN8ZhQqyMLzgRd9
	 X/8qwSUuvD5d+2L2pfTyuGEajqOHx7XHjPGOkU6YKqC9oRXuRtcOofw8w/IZeKWa1s7Ge
	 VREosKY/4DRURR1FfPYZJABDfnYFWb7ghU0fqS8SEcT+4/d3i6HZeEr4IpWiatCrx/3qE
	 zMXPdc9la5bNJTd57Fpu1gVQ1sGe+M4yZDaSFgS3VkamQyMiInlmSvjE6RdxRYTQt9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="JY/wmp8u";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kxub1Oep;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B0A606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 22:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B0A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JY/wmp8u;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kxub1Oep
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793656867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
	b=JY/wmp8uEajzUkf1vNeZ7IdqqrYGiqbB+JyZfHIwoBnRWFnXx6MxOMBQ1QPWUuN47HN3vw
	WfXsqF3y2s4CK8roeZtKzy6VSl6JCH36pHlSmbwr5v1VaCKfqJsb28FskLBuSe+4H8NHu8
	7PydJ4vC0jswAldSb+/rh1oN5K8jTB0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-SklwBip-PeKbP8aETuJaxw-1; Mon, 02 Nov 2026 17:01:06 -0500
X-MC-Unique: SklwBip-PeKbP8aETuJaxw-1
X-Mimecast-MFC-AGG-ID: SklwBip-PeKbP8aETuJaxw_1793656865
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48af5a07314so2223071f8f.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 14:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793656865; x=1794261665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
        b=kxub1OepQwqzw4DlS3rfA1OfAXqLMScfhFOmzNrJ1pTHliNk1VVITv2fVQ/UPxKoLU
         QfvGseif6c5bt0WFIJ0q12sb2pzR4u2J4YfJgBY7U8Om8in4RhWC7yMK34FmrE+4GSz+
         5gXSOvnknqCcZQQIYxRFUSH+fmdwg/m1R0R8VfsuasglNTZRYb1vc9L4ZSq03EUkFDpQ
         EDxoO11i0GUZyyb3Z5IUsmyft32Qt8D4a3HtGkVBQt9F6v0zVqPJqQvaXlauDKBuBqnI
         GfhxNDuwUIHctovuzeuFDmtxLnWhbV/XbrnwbJ+DDZqa2/otPHbkMbnwSEawQFS4m4PK
         1XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656865; x=1794261665;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmYBbIk5usy6FeDyc+DCeJpHSSfN/V5GCfHKFupvluE=;
        b=WS1KYK/CZSNApRlQMlHtnXlAlnKimkJ07jWxePYPtINyZmhNtQ67fXD2U5VUf3Kklc
         wLHKXmruGIsl9453G3NN9D+WJdrPNSeKKb5aZhtToeUVdE1PnvdhWp18Kf+XWLBnAwon
         IYb12OZTJT8Ahbx8ZynlH6QUKoFNoedDPGrN2Ja/wlDhr1L/v4R3KsxTAnRTH8s+5oin
         z+mRBwvgORybAIPDWx2cA4qhWJa+YgS+xqE9yTJwTJay0n+WIM7tEMwvU4CNqhi0qS/x
         LhQvQTnsLQs13GGMi6vK648ZVr6nwxP0y8xaMBLUNVoYciY8lFy3OSyw8IsXKkXmMLsX
         DRFw==
X-Forwarded-Encrypted: i=1; AKwUvBwHTZyeWrTJQEOiXE10GHaoV12xRwO9Gr+J3HE4xUI7bx60bd46Ttj3UBesLbC7NUSYu8Wcpcbwff/DVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z92qeS1pRAiYvN3DHPij6amp3G/LUyck/MrBG+kzISIDKx3Tzw2
	7eAb18ExDM7Fs3YmJ+4aLlRWjlTXBEQoDHbGKxysdf4M6tI1GZOCuss+3i2eO6wHiHs4HA4hu/5
	eH8IpGArIP7ohXPLtxZWNPWfWr6obWsqkUZi03hgBLf4c6pGndNTaDCU7RCs5khld
X-Gm-Gg: AYBFou0/rqCZupKgdcW+ft/RaJlrgwdnaijd9vbHV2holiYLHpOQOHnI2NrdQTNyVQt
	EFAgbHzPErQkmk5nGHLNKKDSz69k3MJ9lyNMRUxHJdS7VXwNtM1Swlt8SHyyur5owUcKeStzuWv
	HSOeH9+COxr9sw0k9bbHUBqP4IVp/lOweEkwq+ykXKCf7OuYHQfirJ2UlS6jwnfxUzWeXTu46Z1
	amRXa0FES16JIS9mcCU2OebHB8zk85yatG1S47Pz7chbf3VspQ3ZvlTwf6u2luZQe8jrhwQ9hut
	mrrLBGiZ2DvmqY7OnVROwVlfzudbnlMuvWSWia+nhypLsO/EkTsa4N4S1Y7bknUd2MFXtAmcq3n
	/xcujXa8XJhshsY64IkmxX3C5EgG6inQ/WmmoluK8Jvpvc33F+QtOVIOx79EVay/u9gGAWOFqGo
	O5rTe9uJkCfCWrStvGBt8hIKyoEM4qLQuQTiaudRWD0Pg=
X-Received: by 2002:a5d:5f41:0:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-48e6e2eb83emr27445807f8f.16.1793656864992;
        Mon, 02 Nov 2026 14:01:04 -0800 (PST)
X-Received: by 2002:a5d:5f41:0:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-48e6e2eb83emr27445750f8f.16.1793656864628;
        Mon, 02 Nov 2026 14:01:04 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm20953601f8f.56.2026.11.02.14.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:01:03 -0800 (PST)
Message-ID: <f4f0fbd6-63e4-42d3-87bf-9f888a8de1a8@redhat.com>
Date: Mon, 2 Nov 2026 23:01:00 +0100
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
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Mina Almasry <almasrymina@google.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sdf@fomichev.me, kaiyuanz@google.com, kuba@kernel.org,
 bobbyeshleman@meta.com, asml.silence@gmail.com, dw@davidwei.uk,
 ap420073@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 horms@kernel.org, shuah@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, phasta@kernel.org, andrew+netdev@lunn.ch,
 sdf.kernel@gmail.com, hawk@kernel.org, ilias.apalodimas@linaro.org,
 daniel@iogearbox.net, razor@blackwall.org, tariqt@nvidia.com,
 kaifengw@google.com, dtatulea@nvidia.com
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org>
 <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
 <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
 <20261102185856.1824792-1-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261102185856.1824792-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 19:58, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 7:29 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 11/2/26 00:16, Mina Almasry wrote:
>>> On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
>>>>
>>>> - [High] The dma_dev use-after-free this patch says it fixes can still
>>>>     happen for RX bindings made on a virtual device that leases queues,...
>>>>
>>>
>>> I know about the issues with leased devices. That needs a bit of a
>>> rework, which I have done locally, and would like to send out as a
>>> follow up fix.
>> Will such follow-up rework the code touched by  current patch/series?
>> how much? I'm under the impression that at least the fix for the issue
>> reported here would be quite overlapping.
>>
>> /P
> 
> I pushed the follow-up branch on top of v5 here so you can see the exact diff:
> https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bind-map-dev
> (commits: https://github.com/mina/linux/commits/devmem-lease-bind-map-dev)
> 
> There is some overlap (~55 lines of v5 touched across a 6-patch +262/-99
> follow-up): it renames binding->dev/vdev to binding->map_dev/bind_dev, passes
> the net_device explicitly to net_devmem_lock_dev(), factors out
> net_devmem_close_rxqs(), and replaces the !rxq->lease / !netif_is_queue_leasee()
> skips in net_devmem_dev_unregister() and mp_dmabuf_devmem_uninstall().
> 
> I kept it separate only to keep this net fix smaller and easier to review,
> since the lease issue is pre-existing. Happy to either land v5 first and send
> those 6 patches right after, or fold them into a v6 if you prefer avoiding the
> churn.
I hoped for something smaller :)

I definitely would not fold the 2 series.

I'm wondering if this could be considered net-next material? pointing to
net-next will offer better guarantees for all the work to land in the same
release (no need to repost in such a case, I can apply this one to net-next
directly).

/P

