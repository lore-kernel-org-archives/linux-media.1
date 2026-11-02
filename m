Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633385;
	b=szx3pONiXzlu4WyIyHU8runoaLJQRimU52FUJPevgcFqPMDXW/DTjkLcuEDwv6hrB4fd
	 9hatkOFkM7yDsktueOkeDYJ4OLdtSLyxnXMWpteBZFjbSaG7WgWZUztFxSWdADXx5D1Cd
	 QlTJSBQkdAShFiv+vxj8TWkv+UYCu9oQQudnQn1YRwoxx4uXIHiKxBLjxekmdpRQdABPy
	 KbzsoWzbmZQEqKAlI7D9yv9yYta39B0+yg8k+8EkF/cdU3jtrjEmEjQ7uUxLZ4U/UbFXc
	 iF+08AkImSv122PPVpFX6R5A8WXs9sb/uZKBbONjvDDgsRuTvtR+2QuS5uOY9LSuQ2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633385;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
	b=2oVs1X++q4+cm5LDHv0SUwMbgDzsrI9NpQGEzHBCfmF3eeDcf729m6s7N+wvRp4yT7bW
	 x5Av5LC1RhCMVsQFegdmGXwDQd0u6AEYXPIMqkqjeuzHnaxnF5PMd/8fG/iQZYf5Cnshn
	 ytzukXS7lKk0ZjRLb2DFA3EO5fznXtRgwloiIeKEjCEmgussSX7Q7ijCvt8Ufkz1/Tcrv
	 k957Pra1JFG8MOpHtjuoKLg7QMX5w4mqX2muVeZTMqiJRs1BRRdX3v7W0wwU7vNC9dR0r
	 ker0NuuBxeA6cbrSqBQQ1mWWUiRgsfGrg2ufV9v62VQ6HncjT1jCq/10qlSJQ7w3EDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cvXQHGIB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hcBLURsf;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273E16086952
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 273E16086952
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cvXQHGIB;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hcBLURsf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793633384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
	b=cvXQHGIBaOY0vkQQL+xRf0PdTa43xJoAqkHe5yvohAycfi0JDDbt+Y2JwdmQGbkXAkhAiV
	5qXM6FLS4aZoSg6M9M/RYo25GT8VY+6NUpL5cODiVTQg9ZY4NBbH8YTwm/AAtJjn9XWFtF
	dMjpfvyFFQofXumPVcVneGThZ9JkMuI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-XSwZX8nXNOe6czajBtE6Hw-1; Mon, 02 Nov 2026 10:29:42 -0500
X-MC-Unique: XSwZX8nXNOe6czajBtE6Hw-1
X-Mimecast-MFC-AGG-ID: XSwZX8nXNOe6czajBtE6Hw_1793633382
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso27038375e9.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793633381; x=1794238181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
        b=hcBLURsfRtjg2HuuwMAZl7i4m7ZriuFIrzulk1WO/LbySuSilVcgSb0b9AOaiuyDNo
         HtkClw12MfC9nVtlcOjmcdIcX/Kj0jiB93zBsDVi+NOUFVuoSgFbz+enLXX6uZ3Q4pty
         8JfFEDlwzZ8/F/OqvPYM8QhgShCEguOXy/FFllVBRMV8JKBYEsR07wW1Yhi6jzhvB2Pd
         7LMpUjGJYX4Fys8YBKp/FsRJZlxmqxj6/4x6y2aoqVdMZOGbyO+eye8GKcZc5AR8fKR8
         eVVEHf72KhAgUUx4awabpwWdxNXvcWd8p0YAj56XTs2pr7arY1D47AQcO74IrFMv+V04
         h4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633381; x=1794238181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ttXRStBxZjXNHjuvGXMWk9I1gtHZhhcUuBKOaR2A9w=;
        b=dosFcn6xfWzVUkGYXtl41ZWieSIShhjrBkpZc7eEYilc1nAn6THMn+l6/1LHngkGlW
         ZaOomOig1p7rGIdyFhDR1QazXoxin57oR+RRQppCg1I60ksLrjcSeJ4iG0LQgRznnY+X
         /1br9hnrnvpYnl/i2WAL48AFS/x4pXG2mOtEes7PW6PixiIWefCuoSpbBbFelL/egZfo
         n6VhrhKI7Tx/mcmhzzRLmDeFC0Q5qg9IBmcen6JA5ck1hY27t8Ww/95g3lvTYACCarKA
         Fe4YeHPKLxOOGvdEftAAT7ehDmvtn0fdV7m4N3kL5DSltQ7mv+5S10OPBCpgBy0q84xf
         lhDA==
X-Forwarded-Encrypted: i=1; AKwUvBw/0n1BAVYLlDFvwcPYIra+LomIq0rRTSJ5Gcg6ru2+IY5MdlEV9QTxpI2pvVoJ8BjUmP073gCSStbaXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL6jnKZ/GzN6LDSpTZCNTH5YrNmnjVxWh/ShKfQSpdMD1MFpu0h
	hkKjsez/QZi1RqVqGUQ/GgASv+YhA9U0SG2426VBnUuFa7KDEAQIB3lz0rcXcrXpE6wE8MMg/Dk
	7Z7WaH4LHVP48ntktfr66rkWZ8I1FPSf8iNUzIEUC52wVA46Jsc9RlAnUc3p+VlFb
X-Gm-Gg: AYBFou3eCBOityIlEkFaBo5lv70udl3l+Fl3aqTgPXtKfxlnwG/9FIs/Ax3cPSw7fHb
	Zx7+aR5u9zJMt4pw3zO/kNMt/qCdGZ2Hgklg/ER55boxu0iwFa+LNecfbfMWX6qcyDJxDD7Pgr6
	rXvpvXSu6LWl5jbztfCd8ZMKDYg1Na7BOh/DtqtX6apQIVhO3NRYByv9nXTc998TtdoJxEn7Kpt
	PbdWeUzZutSGZiPxtf3oFqpQwKH8YsRggnnKomVNkwjKJKHBmVAGzPaAehAM8MVZ59vNUxcIkrT
	DrmwmbCaUlYVYjguTQM/hs507mSCJlWIt+ZEZJJCMAimj7XEQPs5QMzkNECPKJLiSHM5X6VmUj0
	h5CiGnw98s20h49swueeTYTSP2ifcGukBQ3rwHPt1dRt8ubfSCNPczfJjeV4Xw1qqrEOuwAUl7r
	4GQmEY/0jcqMyvA9Zmfr08e7nQql4Qcj6g1xjF3xyntsU=
X-Received: by 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr241030065e9.17.1793633381417;
        Mon, 02 Nov 2026 07:29:41 -0800 (PST)
X-Received: by 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr241029635e9.17.1793633381011;
        Mon, 02 Nov 2026 07:29:41 -0800 (PST)
Received: from [192.168.88.29] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm352011105e9.4.2026.11.02.07.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:29:40 -0800 (PST)
Message-ID: <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
Date: Mon, 2 Nov 2026 16:29:38 +0100
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
To: Mina Almasry <almasrymina@google.com>, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sdf@fomichev.me, kaiyuanz@google.com,
 kuba@kernel.org, bobbyeshleman@meta.com, asml.silence@gmail.com,
 dw@davidwei.uk, ap420073@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, horms@kernel.org, shuah@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org,
 andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org,
 ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org,
 tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org>
 <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/2/26 00:16, Mina Almasry wrote:
> On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue(s) to consider.
>>
>> Critical: 0 · High: 1 · Medium: 0 (1) · Low: 0
>>
>> If you believe none of the issues are legitimate, please reply to each
>> issue of Medium severity or higher and explain why the AI is wrong.
>> If any of them are legitimate and you plan to respin, please let patchwork
>> know by including "pw-bot: cr" as a separate line at the end of your reply
>> (one such reply per series is enough).
>>
>> - [High] The dma_dev use-after-free this patch says it fixes can still
>>    happen for RX bindings made on a virtual device that leases queues,…
>>
> 
> I know about the issues with leased devices. That needs a bit of a
> rework, which I have done locally, and would like to send out as a
> follow up fix.
Will such follow-up rework the code touched by  current patch/series?
how much? I'm under the impression that at least the fix for the issue
reported here would be quite overlapping.

/P

