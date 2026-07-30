Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0666244C51A
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428267; cv=pass; b=Cciy1ofhsuEGPYbWXJT85YPhAZBja9hNhiE97d4tSvfdEYwLx8PL6TZwDS0JVhcOFxDMoadh2eCkLT6YR2+ua1AY0LMPFtDTp936nFJL/Ugtt/63HqInzPWKhk+JnranK9+DA+Jq+SiLI7jdQ89uGoTRhnVbawqj6xnN7gGd0Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428267; c=relaxed/simple;
	bh=y9uL8axv/bSBp1hJEk9/5EREqK5uThhZ6LCPv7JfjT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjUKAFxKyQff/YqcllRibFAwd2WEYDxHDgauwOWWgH3eiY/tBIc2UICZ2BzEBAPIi/UhzyglUCVFcP2wG/pZHpreo3cCqXYiTOnwC2MMUmpNIRY10U7qc5sUB2eGw8qlz0rTDztEz9BUPZUvZ3UzSdaEQy0D9aOZZiznEXTNMxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MqCUIO9y; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MqCUIO9y"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-451ef88519aso7740fac.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785428264; cv=none;
        d=google.com; s=arc-20260327;
        b=QfixtB0absh3FciyOoppUemV340QpuAowzLNtUlNV4L9Gg4/FRfY9JgUKUyPJJA0qV
         /qc5ZGWaKtWsjKCGYsoXvi9sIiPZP038yGsemnnnwiwjOTTZFgrlVDfD/4B2m8rSkvp1
         r1CtJmyVPgQgMBjQpLj9r38OlzYRSWgyhlTHuejdeqzaxKxAnyR1YQOC8xoz2l4/mRAT
         962M8UxsAnJXHW2KtJNRKPhu6m7FOl9+SfeAFPanpdvAd5821As0smXaMcM1uORO7MKN
         ZjXTR2mM3UleKGiVb4m36fpU5IrMImhKwEJQ7XJ0Gt5wSItl7g4HAjJxs8j2sHBtY5sd
         pCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y9uL8axv/bSBp1hJEk9/5EREqK5uThhZ6LCPv7JfjT8=;
        fh=CM0bPbIjv1uaMPECflYJHSIj47DKZW/zFz9SN7Nw+Q0=;
        b=jT39ac+RfHRL4BeAgBItr6lilR3QkCixP/TtQWGSab6kNeVOz+Jr/L4YtpXuVJpBf+
         CW1fX/bhyd2/XJ6chmfb/MwjsppmqyqYtsVPtRidvZJ7HvKyrQmyCZmAoRLvQAULGb8Z
         QLZXQiPdMzynNrNSu9GAVJUJ3ut+2xazRhtKXT+U3ckTEu1gVyWAf9kZACdKe1okQbss
         4KZASPhJ9vRAjs6iqMJAbIwgLAAMwknw3UOwpLjvx2wIR5DcHx5SpivJvsGDe2nUT7iU
         X6QRC7cnWT2PRDRdm/ffSlTL9sasZlzZQJ5GA+Cz6PS8z7Ppu1SRjKwelRrZFO+DK9K8
         n2Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1785428264; x=1786033064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y9uL8axv/bSBp1hJEk9/5EREqK5uThhZ6LCPv7JfjT8=;
        b=MqCUIO9yyYJwHrMDdiejiNqcDHA+nR86bfqK9iKWYUvi4dsxosqLK1HYtjLP+5hW70
         k5P3caMtPDuMcCd+Q73b4jXiKqkWofjW7ZGye0Gp8XbL+MuQteuqTWNusN4S1MOtLD4h
         f043KR8DclrbfQVIx1LIlJafF4mkqxY53CJGgcgKSlzzpPwATxfWrBB812Z2bO/xO5EC
         elYoFSb15ifUMJi3Yt6rGgvVTnyac4gvXe8Q5aNLZI3twpMmhH335Lq9BUPv5Oxu/My9
         v6K4aHa0gm3jyf/WIJFeYkP3hvhEKOXplgljdRIOV2CPW6euwywntOV8pDIXxSVXpgaz
         L+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428264; x=1786033064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y9uL8axv/bSBp1hJEk9/5EREqK5uThhZ6LCPv7JfjT8=;
        b=pQ4xPfQzLmOa81xK9lht+jftQJouZ4zAhxwKp0snHxNcsgFggzcDQuVZniYq+fsoUi
         vNhTXRkaNk4dvUrjLpcC/QgVvHIfND0q87xCFg+pf57Jwwwm6mH5hQl2ZW/2sk1JtYCg
         eZUSHNgx9Wn19SbysShIFQAfjbVStq4fDnFMxsqaoBj4mlvm1Oj1GFdgeF9SYHhHwcGm
         7B5aKNQxqMclP1sMVKblfX8xOrHIb/vtNtjtSjfbpOdWpsy/mTiRdxM+Y8JlQLBg3HC4
         cbeA4U22+wz8G3cg+SJBSTLXE3pjKedlp0OcshR7/mXFPJHNOGOKMS9U35H4+qqTzKjt
         5UGA==
X-Forwarded-Encrypted: i=1; AHgh+RqBYKFw8EpIx3bd4wxvoOW3FQiOqv9fFGPbopQECapFICL4R/YvQgK6eibEGe9nhMzEFni0Qt50MimnKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU3fGwbftzLpQ9nIR2UufqYFEjqCihZBL02wSIbHr5clM1SadA
	X3w2q/r7aGnAyCQYg9YXMTPARHr7mhgubEcz1ne78CF6uJayOULnMtv8E0m/QNKT1C/Rr9QIeb8
	CLELuS8/xkE7fKkXuXSrkvRmYe9t/uPd/rUlYuzzw3AfQCOjQVlouT20FhA==
X-Gm-Gg: AR+sD10wmdlk+wDB7vNg1NiEA9QXKjcGIF7Pp7LdhLuJBHcKhXBEZZ1ZCoP2DY0rExF
	1QWvJ4A/GRybZAe+4wx9CY3R98pFg2WXRmfcc6piB1oNMiV7zeiki+b5fwf++P8TZp78xYJ1MBu
	ymlbxT1MaI2MvmVkEhiamzxz5OIFJDtq1E+QBPKM1p/d9w7/OQwWtzyIXgK6mUvNzoEObNiRD0r
	UKe5QOeTa+EQowrrIqNjhgfd9FZWIiAkoOy8hUYmxC/oSNit3o5ypW27G8lbv9BnTzUXLcOv8Jv
	C7wkjVQ+tuy0c6cfZwlvfXPEaIwVb1/g/qwH63r2pDtn
X-Received: by 2002:a05:6870:610c:b0:448:8595:1e8b with SMTP id
 586e51a60fabf-458dd203cc6mr828125fac.4.1785428263717; Thu, 30 Jul 2026
 09:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785274111.git.asml.silence@gmail.com> <19e5c945ea8114320c10f7951d19197d48b59249.1785274111.git.asml.silence@gmail.com>
 <CADUfDZpwF0jp2e=+c3w_NjWPbnQ858bkSD731M6+x27jzgcJiw@mail.gmail.com>
 <CGME20260730104131epcas5p4b52720519486f7ac774c317923a79c81@epcas5p4.samsung.com>
 <de4ec386-42ba-41c3-bcbe-1fe8b2f71ba9@gmail.com> <09134617-6d9e-4963-9319-1855e88a4df9@samsung.com>
In-Reply-To: <09134617-6d9e-4963-9319-1855e88a4df9@samsung.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 30 Jul 2026 09:17:31 -0700
X-Gm-Features: AUfX_mzVuCLkHKoQjKU1BgpL-X0Ty4OF1wEt1trnCKGouEKw-m3DZTMxHTHiuQw
Message-ID: <CADUfDZoVUHMWK0KBnznB73o6Vg+iQBBzJE2NmF1Tf22Zvh4=Yw@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] nvme-pci: implement dma_token backed requests
To: "Anuj Gupta/Anuj Gupta" <anuj20.g@samsung.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	io-uring@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, 
	Benjamin Marzinski <bmarzins@redhat.com>, David Sterba <dsterba@suse.com>, 
	Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev, nvdimm@lists.linux.dev, 
	linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 4:36=E2=80=AFAM Anuj Gupta/Anuj Gupta
<anuj20.g@samsung.com> wrote:
>
> On 7/30/2026 4:11 PM, Pavel Begunkov wrote:
> >>
> >> I wonder if it's possible to perform the PRP list page allocations and
> >> initialization in nvme_dma_buf_io_map() instead of the I/O path. The
> >> NVMe dma_pools are per-NUMA-node linked lists protected by spinlocks,
> >> making them significant CPU hotspots. If the dmabuf registration set
> >> up a contiguous DMA-coherent list of PRP entries for the pages of the
> >> registered buffer, any command using the dmabuf and requiring at most
> >> 1 PRP list page (i.e. length <=3D 2 MB) could just set its PRP list
> >> pointer to an offset into the dmabuf's PRP list.
> >
> > Possible to an extent, predecessor patches tried that, I left it for
> > later to keep the series simpler. I guess chaining won't work in
> > general case.
> > I mentioned this to Kanchan, Anuj and Nitesh before, they were up to
> > playing with nvme optimisations in general, and since sgl from Anuj
> > is ready, maybe they already have a prototype somewhere for that.
> >
>
> Right, I have prototyped the PRP list optimisation before. I will send
> it once the initial version of this series lands, to avoid adding new
> review churn while the rest of the series is pretty settled.

Sure, landing it subsequently makes sense. Glad to hear it's already
in the works.

Thanks,
Caleb
