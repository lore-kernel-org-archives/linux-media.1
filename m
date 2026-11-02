Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645939;
	b=GEe7NktZHBf5wzUsRLE0cHd85NrEGWDcJ8msYIknkpu70w/cKhzcrw0qoW5uvL0ueNQ5
	 PYZc7gRXNtkuVZpS0YcGsWwBbr6TSJthYfM70brOow+Mwk5CRr84TovlLk5pHdtIi07hZ
	 GuNqhly+DyJpTQJC/L+ivqLxzWYL1IfrRL4waQq2ZS4ko7WUyEb57uSjV18HXDYEridrA
	 OH5VncA0qgqYDW9izT3plRQ3boGPCO/5RlKmRcgNCYBPDDNDKyv71lqJqW+ZkYhw+EVOO
	 S4W4rM11TX5Q8hu6OSjHJ38zqMqgRYa0Yse5Xw1RWywmahi4S9gZLgIgP428cAStwgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NbysLIrexph35LgjM0FGUGuc+zi/f3zUiCq428yT1Rk=;
	b=XJSY8uw3qX8H51xwM2oTBCqW59pAFePfngzsY72SUoqwug7aAeJ+j+VhZyC10mJ5E5IG
	 coBI5HFKE5O88k5hTpUhlBUwe8HMnMrVlCZWph/agxToCu+8Blm7eKWXNQjtfbx0qTK+H
	 nmRX1ToeuWXwN041DxprBG2i/n6EspflwdvkA2x8t8fMxZ4D3xyRh8nrQTqw8BbbeL5MK
	 NKog+2hKfXTr26X0+g2qmU7M0QlyLQ534V4B6fTgm/xi7BGXjpVlvS4O9tFew3X55RRul
	 /KayNbPVhAYf2hi1cu0mbVvNb/rBhKqDdsQBllMR2M8vJZFRDIZlWIdZpti1cXDH1NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PozYLQ4w;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9B6606A326
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 18:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD9B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PozYLQ4w
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a190c53a3so4522443eec.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793645938; x=1794250738; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbysLIrexph35LgjM0FGUGuc+zi/f3zUiCq428yT1Rk=;
        b=PozYLQ4wJ91rva5JAu8n7V3l3TRDv+1xTlmu1F5D33tEMCR3nJEayW+q/9H0EOctz+
         TfaRyKv5C/bbE8DeFK6+i3wBa0qp+pQZcxEeQ4XpZDijoqoiYdBKMgde0/0nwXs7dS1E
         h2mmTx0ujLGzkGXIv4fph/lIoMxttNu0BT8zNdggyCPDidxiGeCh8VCmIWaQ5UoiK9M5
         9mDPDUnqV3q5suWt0EGAy2i56UXwy3KlDoUmS6pG9716ehk9wUTcilc0uiQoTz4vkdNP
         ts4y9t3PqFDZgAbUc5tbQ7Q4zevugRIZLPqimSAhyPDLATEGDCjCZI5vfBxkpBln3N7r
         zHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645938; x=1794250738;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbysLIrexph35LgjM0FGUGuc+zi/f3zUiCq428yT1Rk=;
        b=lk9O7hoDKyn3CnNvDq2mmd1+xklFPyPufhkpWBHUIjEz2QMjwOBgmCpMex5QedUFqN
         QK/ruj8FDX08ds+YLsEGMK6PqdZ7ZttgLWL5HyS1PVBa5lqaXqByMh+ZIqq6L/KhAvRs
         PNNp0dPQU90d4kOplJjPuKx8BHi39Vtx9slVKYKjAVBwq2xk3h9N81E2aTdXjPbWhrRO
         B4R3fhvY2AWyuUFVjmD1A8Yq9NJKXZgOsp4Zwgw2JJbtjZOc2AuVzU867hMDrbEg6TcZ
         ttU+vRgZdZgdQWFouQhK13hBOnP4X2rHZnGpJAqtNPBcwSC2vgVqLTJQi5O38KaCew5Y
         +ORg==
X-Forwarded-Encrypted: i=1; AKwUvBwVXdu+ZmMdpGJsaplRVqnK6cXx0+BOGKTRsvgGZL91SkPIAC3J8Int6NUvNDjK6KLoHK4m0UefaNrtLQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9EWMcOaQD5EyLGRFq4KfJEZnHjnsBw6WWQ7SDCkRkdmnRRLFNU
	gnxSFXQNpwIiHBSiOH18sQ2RY6BCwnPqM4w0GmdnwwPPisgOL59lXIpEoMMwEXX8G5eje7gqXg3
	HvWa2EHdqWh38lMyN27GVYYi4Xg==
X-Received: from dyjo24.prod.google.com ([2002:a05:7300:3398:b0:359:198a:8046])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4d12:b0:369:dc59:7a6f with SMTP id 5a478bee46e88-36a422042d2mr15472016eec.1.1793645937269;
 Mon, 02 Nov 2026 10:58:57 -0800 (PST)
Date: Mon,  2 Nov 2026 18:58:56 +0000
In-Reply-To: <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org> <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
 <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102185856.1824792-1-almasrymina@google.com>
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
From: Mina Almasry <almasrymina@google.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Mina Almasry <almasrymina@google.com>, netdev-bot+sashiko@kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, sdf@fomichev.me, kaiyuanz@google.com, 
	kuba@kernel.org, bobbyeshleman@meta.com, asml.silence@gmail.com, 
	dw@davidwei.uk, ap420073@gmail.com, davem@davemloft.net, edumazet@kernel.org, 
	horms@kernel.org, shuah@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, phasta@kernel.org, andrew+netdev@lunn.ch, 
	sdf.kernel@gmail.com, hawk@kernel.org, ilias.apalodimas@linaro.org, 
	daniel@iogearbox.net, razor@blackwall.org, tariqt@nvidia.com, 
	kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 2, 2026 at 7:29 AM Paolo Abeni <pabeni@redhat.com> wrote:
>
> On 11/2/26 00:16, Mina Almasry wrote:
> > On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
> >>
> >> - [High] The dma_dev use-after-free this patch says it fixes can still
> >>    happen for RX bindings made on a virtual device that leases queues,...
> >>
> >
> > I know about the issues with leased devices. That needs a bit of a
> > rework, which I have done locally, and would like to send out as a
> > follow up fix.
> Will such follow-up rework the code touched by  current patch/series?
> how much? I'm under the impression that at least the fix for the issue
> reported here would be quite overlapping.
>
> /P

I pushed the follow-up branch on top of v5 here so you can see the exact diff:
https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bind-map-dev
(commits: https://github.com/mina/linux/commits/devmem-lease-bind-map-dev)

There is some overlap (~55 lines of v5 touched across a 6-patch +262/-99
follow-up): it renames binding->dev/vdev to binding->map_dev/bind_dev, passes
the net_device explicitly to net_devmem_lock_dev(), factors out
net_devmem_close_rxqs(), and replaces the !rxq->lease / !netif_is_queue_leasee()
skips in net_devmem_dev_unregister() and mp_dmabuf_devmem_uninstall().

I kept it separate only to keep this net fix smaller and easier to review,
since the lease issue is pre-existing. Happy to either land v5 first and send
those 6 patches right after, or fold them into a v6 if you prefer avoiding the
churn.

-- 
Thanks,
Mina
