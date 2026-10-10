Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A22A35AC14
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791640953; cv=none; b=gsWPN1bk4GOFiFZi/7MmNaLtyhG5iHys7TOB5j/uOiO8edsyC5P7JMYUe/YZOv0uF+XEPwRTLRRCJUkOBiMTmFXoHmIY+jx88nHsYS1EZ0krfROlGZvWqYNLXhINlxhbGhbVrtPxysHgXpTLhvpfb0NFEY+ORewPWaNQpDz7YjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791640953; c=relaxed/simple;
	bh=1nn/gxCVP607cWus+kYr5yIsKr+fX0D4lXIQhCvbtzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRfhVCXUwB3OCmELxoVpqzaMh8iXmkT634l+dXghAQdQtTO2B+6LyHrXyg723BzqRJw91lgAJPyCbsu4nGZ7UW3A2snjUUY6pSSijHKnCskLQXjdHXF7wdsbT47dqL7RbAj82pKfq7oGibRNX091MLGnp67eoriZ+sYmK8KogXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDSQdYr2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDSQdYr2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso541609f8f.1
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 07:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791640950; x=1792245750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7F23FNsErj3fpOWKD/UF72cX4yQCCC/yv71F53gfj74=;
        b=qDSQdYr2Z/+mdWr5U9bMM5gDAIS4cjZD0yDeCyIfsFfHYpIe/gYGLc/dT9OQDe5ZyM
         pr1zGnzEzFNtrH3AraRLJ6Ba7MLXvgw8eAvI2boZA1c+xLYps7STj05CZ2fsPMO1pFEs
         nXqebZNvonbBefAXm8QHluLwoyANWBzBWD2LAoyzeIuVMJRSXsczb6rAIB2iefqSw1e+
         QadP+/LKkS0pvPI4VX4T5PfEo0OuISIWLLWf+iqvMkOG29pP1YKP9igsoEcRVEjjDIyV
         K3PQn1aap2b2S6seVp+UJo6X/+taOuJZj0PqkoCpHWbR1SQkTGsaOB1LGjaoGFe+MiDC
         H1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791640950; x=1792245750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7F23FNsErj3fpOWKD/UF72cX4yQCCC/yv71F53gfj74=;
        b=zJ6Qr5bvmjjaX9aaKqOnKdZ8dFcFP7j4cDBYd64BJBYfcCj5ESBooH49U8ZbZjJezn
         9q7WRGIrqy3Y8FDGRDKRU7Y5h/iAK8x9D0FW5V0Pr8hT9KS4RMu9//XIIscO7LSu55NP
         QB3TwMSmuQ9IPswIrwgf3XLGUG4pFQJSZ/sLRMg3jY9PNaUA8paLnZd0nKV+29GBYkH3
         j+xGKWW7UP1OqvGXi6amXSnRkn0SQQ0kIvnrNEqoO+RGLkuMdnmnp3uVklPkkm3hw7Qn
         rXzNtnq7ugsD7fZfksYaCw5JqHZ5GBLb55IXU6JdoGy1j2hW4j6P3Azr/5j85ebGkmNA
         XlWA==
X-Forwarded-Encrypted: i=1; AKwUvByAlADN9jMKeXqyy3t3eFB0zKWq19sxzd9wlLwSxHcMgSb+lOxyP/xYuSk+C5eqDCjPXsSqo30e8QE/EA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNy5k939CRg8p+jVmQO9l3zBZkH69yGnpS0yWtsc4YfhCKyEbv
	K6pCGzySh1Cmtxzx9CK3r2ZBeAIPSjYK2+8FPt3CyI4zFYLnUJbOx0ka
X-Gm-Gg: AYBFou1UdJUhjck4pWrBGv2V1KsmvmejCQyqH7+G2rj34kzKR48ZLTA/E8aAKNwviV7
	FwVdL3A3rnn3XtOFJNSt00med0V9UuDZ8KcCAFEZtDYWOCmYHyvzDRDfk/3bG4GQcBn9rvP0PXv
	eJQsabRiUgxwzV8eNssXqZzHo/t2psYoWma5HjLFwmM0anBtXQTmPT6ZXcTKVw0gfC5Dnh5xP0T
	qMup1cv7ZF6CPoNIXdD0YJjpVvIApknTqiBzjfoHPTsHvr/LTMDX3VAbe0ZRNMahPwniMLyih5a
	MY5NwXC4S9DkMp1Xhu+ri3ZkFUXFhedsU8CPij99F4c0K1LE1vEEy1K1SlBcHNJPrBkdr3KZAxs
	Jejc5UGEDYsqzovlIJ0G4X2vQGxslqSYE5H7g7VFsVVripdthb7IK8VS+aOvNQrLmzjU6N1+1lf
	eUxaI9oZz+5sQm9MaSjlELU+IveYVsrQk4wofH/62DNm9Cl8IS3dvzaFuC5vXi7a6uwbzb4i/La
	MGS586e6r8N7v97tKTRF+2DBo+gUDDuJDHUmahodQsJIrcl+Qd21gYlz34wUo8bbT8Zsx3CDn5o
	nw2qer0hcXqpzzaqTx732ECYOpEMndgSljrkBneOuKiyVjk9
X-Received: by 2002:a5d:6992:0:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-48dba77d1ddmr7509477f8f.1.1791640950478;
        Sat, 10 Oct 2026 07:02:30 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463499sm8727077f8f.3.2026.10.10.07.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 07:02:29 -0700 (PDT)
Message-ID: <12d8d2fc-6b3a-432f-b27d-e27bea01d697@gmail.com>
Date: Sat, 10 Oct 2026 15:02:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Mina Almasry <almasrymina@google.com>, Jakub Kicinski <kuba@kernel.org>,
 David Wei <dw@davidwei.uk>, Taehee Yoo <ap420073@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman
 <bobbyeshleman@meta.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Nikolay Aleksandrov <razor@blackwall.org>, Tariq Toukan <tariqt@nvidia.com>,
 Kaifeng Wang <kaifengw@google.com>
References: <20261010025532.839559-1-almasrymina@google.com>
 <20261010025532.839559-2-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261010025532.839559-2-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 03:55, Mina Almasry wrote:
> When a bound net_device is unregistered while userspace still holds a
> netlink or TCP socket reference on a devmem binding,
> mp_dmabuf_devmem_uninstall() clears binding->dev to NULL so
> netdev_nl_sock_priv_destroy() will not touch the unregistered
> net_device, but leaves the dma_buf attachment mapped until
> __net_devmem_dmabuf_binding_free() runs later on socket close.
> 
> Because dma_buf_attach() does not take a reference on dma_dev, device
> removal frees dma_dev while the attachment is still mapped. Closing the
> netlink socket afterwards triggers a slab use-after-free in
> dma_unmap_sg_attrs():
> 
>    BUG: KASAN: slab-use-after-free in dma_unmap_sg_attrs+0x76/0x2b0
>    Read of size 8 at addr ffff88810fae64b0 by task kworker/3:1/53
>    Workqueue: events __net_devmem_dmabuf_binding_free
>    Call Trace:
>     dma_unmap_sg_attrs+0x76/0x2b0
>     unmap_udmabuf+0x8e/0x100
>     dma_buf_unmap_attachment+0x145/0x330
>     dma_buf_unmap_attachment_unlocked+0x96/0x130
>     __net_devmem_dmabuf_binding_free+0x156/0x2e0
>    Freed by task 9:
>     kfree+0x1b8/0x550
>     nsim_bus_dev_release+0xe/0x60
>     device_release+0xcf/0x250
> 
> Add net_devmem_dmabuf_binding_unmap() serialized under binding->lock
> and null out binding->sgt and binding->attachment after unmapping so
> unmapping is idempotent across queue uninstall and deferred binding
> destruction. Call it synchronously when the last bound RX queue is
> uninstalled in mp_dmabuf_devmem_uninstall().
> 
> Fixes: f8350a4358fc ("net: page_pool: add a mp hook to unregister_netdevice*")

It looks more like 170aafe35cb98e0f3fbacb446ea86389fbce22ea
("netdev: support binding dma-buf to netdevice"). The one in the
tag didn't do anything interesting.

The fix looks good as well, might be a good idea to clear
net_iov's dma_addr as well.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

