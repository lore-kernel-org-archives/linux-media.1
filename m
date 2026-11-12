Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520026;
	b=HQjsy45sLzjW2sDnCdSz9sshVWGEf0F2UxMbMqVKznAGpvojAdjefF/8nIaqmV/Hfbpk
	 Om/8L5UlnCrOxBTYW7XX2j6lXIDmJ6sWvgzbCWUxM9IX8t9LYTUykDHV99agCYBok0FXx
	 YTk4x4OcpZoTWUAljvKesUYPtEk0kWbzC9qjUa+LUe9kbOd1LhJeA6VtDyp+VBJ/O5W4+
	 EZv33SfTJshYUBR7VVA+Br7gyybd4vzTboV1qHqjCZqtdy+yMiF0+rqx4StNJAHfmOftA
	 Sy7Yif55Zxd4WU3mF10zOk0itvN/0f3JvFJ1qPqfXFKgL66aEA5lyststGOO3DWTn6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=MRvrBEIopDqvuVb/vZ72s+DUNbn5hAJVvZTwAj02wNI=;
	b=y3wqg9xy3GhfG28Qpb+oFjZhQulkdy0njRcBwbO2sZDDMwVLDwo7HuectYCmcpzMYOCM
	 H/o0eoqiuQbCDf4vZkVQsNC7Z8ll4Fo+O2MwDrddkF9q8l33l14cVzFPOEm70V0qxO3eK
	 fQ99ZVqxxuXarAveyOLmmkT90EgsBB8Zf2A7k8WP5MiqjOtci91ePpv1ourp9n5AFjRhe
	 1F6Rrh2DD7BL6acjIAy/XbpxBw+CuBTGbMqxHczy2chtEumuJXHR5XPtGPJD1JNVu9LBX
	 tj4Wo0OR6Y6necu7MoMqyF49//503vLP05FUUgNFdIH5c31OU48lTspYM0ycOCFfNEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IqQicUBc;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9244B606A323
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 21:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9244B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IqQicUBc
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so128368a12.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 13:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794520026; x=1795124826; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MRvrBEIopDqvuVb/vZ72s+DUNbn5hAJVvZTwAj02wNI=;
        b=IqQicUBcHFfASsPeC/FaWkK7/Crm2L2UYyn8/PxIFh5d3NQfwGTsj1ea0yYEQ647ZV
         /ccaegp04k9hdkyY2Ail6N4rBeUM3LACMz8nX+7douczOTVskMzZJ6rF5iaIrVQm2heW
         JeAJJRZGwbkWIX4oCdCOf9PAKsBXWkvG0Qf/0hEZ5qTZmjRSXZseI6akOjoL+PPSYmfs
         n/o355gYSqEM305OphinxwQkhxOcncDRdESkE1XHs1UYEEh7UGYPCzuqJ/L28TVUC0U6
         aJlfLAOYc0LEA5khjKc7nJefwozvr0lPgi0RdEjsCmQOzXego5h4dYanuiOcrof8EvZv
         aU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520026; x=1795124826;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRvrBEIopDqvuVb/vZ72s+DUNbn5hAJVvZTwAj02wNI=;
        b=EY+6AWFELDSLxnQP6JRdKRCRB5ZnoCrcf3vnXi9Wdy2RPUVekMh0QpnoOU5hRnZ8Bb
         baKBDs4Wh1vSOSghLEQQN4hJwYVO/UfGUle0INLxQs51+4BbpX17DAbAbOamiigOW+/D
         B4BEMBb2ti1y9YsowQO9vCakOY2Tm8gfzv573Yi/tsDshF5bH/5VsRv7JgEId0pR3KPB
         Xidq3E1x4ZgFfkAM6UpkH8Oho22J1JCpxtm73iUoDSTg+GqUd3duciocCUuFXdIIwueL
         sqQgXnKG7XSV3M+284DNRIDRvpjr2yW8VEt1vXJcIDNcD2Jiar/r2tjaaJPc2eImzhJl
         q5KQ==
X-Forwarded-Encrypted: i=1; AL+hErEGvr8AExYLrpdGU/rK7Y3GbcRoaBhZx7WJwum6T1wLVGvnq/mPPltkYxMz+XdFaVOhDMQQbK+roao2lw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XvW7dyCNaiMJRLfrSCBBF6XcVaE0S2lbKRCGN0h3ysQAOsdAB
	7vTX8+fBUM74CaJN4nwYeW9ubYrKHp0MfsHNqf5vCtc6/F8YM8ll7Xly2/cNTGAzsw==
X-Gm-Gg: AYBFou0X/05ueE5lesmp3tmS+nU7tFQsCVx5Mz+IIRlBqvGLlweRG/FQnfAS0MnmLs2
	9EqsH9zwimwnUUk1B1KrRlUmX4cv1DV5AvnxT1aeFW6za0T9PLFfjqVT7HueicTP40fObuVI4+C
	wu75aD36g4VnFhi248L9062US39bhXIWWPQNMhJyOY32QKDG7R+jgJsFdVx9xTdO3YVWZNuIj7H
	N2TH7EwfqJ+nuqu5bx0P45tslt1y+gS+KtE4gH+rPnFVF1RhWjB1dUtqLgRsn+69BKpO/19k/pr
	zIJaSr57375UOIRJPQ0xMsVvHp5Pf5zQourJ2ZqcMRqyZCBpWPbiqCQh94PNll5pgNvJF+YyNyp
	rRPs7Li3lGj0I2Qxr/51bZUfKwod7NzZVkaJXrkay6MTR2Rl7RSY8yJTVfLOjKSV68yDxQ3MYQ/
	xbZKF4UtdXW9YXFYSp+M2FVYv63kqx0zzxRt1pVgOuNmJBcH86Mll6c1OZ2Ep7GZ5uEpMDZl+VC
	ZNRGj6x1FlvzRcUrHM2CA1tw4J2/NvBRkLh91oUFWLng4kfvBGdwLa046f478Y+H6+yzncreAia
	EyuF5QGUKHEbNkCGqDpwBtT3hN/GdQAaw7lLvWRCkd3aGbLU+J9Sk+VJ3ekw9WmppNI/98FZdYO
	QIMobm6Uqgw==
X-Received: by 2002:a17:90b:30e:b0:3b0:97b8:d6bc with SMTP id 98e67ed59e1d1-3b1b0a0e889mr278699a91.16.1794520025137;
        Thu, 12 Nov 2026 13:47:05 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d257a0sm6493095a91.11.2026.11.12.13.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 13:47:04 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 13:47:03 -0800
Message-Id: <DMTK99TDM9AM.SAM3Z4COP9WS@google.com>
Cc: <dri-devel@lists.freedesktop.org>, <iommu@lists.linux.dev>,
 <kvm@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>, "Alex
 Williamson" <alex@shazbot.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, "Josh Hilke" <jrhilke@google.com>, "Kevin
 Tian" <kevin.tian@intel.com>, "Leon Romanovsky" <leon@kernel.org>, "Logan
 Gunthorpe" <logang@deltatee.com>, "Matt Evans" <mattev@meta.com>, "Matt
 Evans" <matt@ozlabs.org>, "Mina Almasry" <almasrymina@google.com>,
 "Samiullah Khawaja" <skhawaja@google.com>, "Shuah Khan" <shuah@kernel.org>,
 "Sumit Semwal" <sumit.semwal@linaro.org>, "Vipin Sharma"
 <vipinsh@google.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
From: "David Matlack" <dmatlack@google.com>
To: "Alex Mastro" <amastro@fb.com>, "David Matlack" <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111192411.4133780-1-dmatlack@google.com>
 <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
In-Reply-To: <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>

On Thu Nov 12, 2026 at 12:35 PM PST, Alex Mastro wrote:
> Hey David,
>
> On Wed, Nov 11, 2026 at 07:24:04PM +0000, David Matlack wrote:
> =20
>>     Is requiring userspace to re-issue IOMMU_IOAS_MAP_FILE the expected
>>     uAPI behavior? VFIO_DEVICE_RESET (and runtime PM transitions) on the
>>     target device also bracket the reset with
>>     vfio_pci_dma_buf_move(vdev, true) and vfio_pci_dma_buf_move(vdev,
>>     false), tearing down any active IOMMU_IOAS_MAP_FILE mapping of that
>>     device's BAR even though PCI_COMMAND_MEMORY remains enabled when
>>     VFIO_DEVICE_RESET returns.
>
> There was some discussion about this in the thread below. My understandin=
g of
> Jason's point is that the current behavior, and differences between what
> revoking and move-capable importers see in regards to vfio-exported dma-b=
uf is
> somewhat incidental and not necessarily desirable.

Thanks, I will read through that thread. It seemed like a surprising
uAPI.

>
> https://lore.kernel.org/all/arMBqyI4XNfD+q1W@devgpu015.cco6.facebook.com/
>
>>   - Physical target devices and P2P topology checks: mem_bar_descs[]
>>     currently only matches QEMU's pci-testdev, and
>>     vfio_pci_has_p2p_path() does not yet check PCI topology or ACS to
>>     verify that P2P traffic can flow between two physical endpoints.
>>=20
>>     Suggestions on physical target BARs to add to mem_bar_descs[] and on
>>     checking P2P reachability from userspace are welcome.
>
> FWIW, you can also exercise the "P2P" path with just a single device if y=
ou
> IOMMU map a device's BAR into it's own IOAS, and have the device DMA itse=
lf. For
> eventually validating aspects of Live Update, maybe you don't necessarily=
 care
> if an actual peer device is being DMA'd?

The way I designed the P2P selftest support requires 2 things:

 (A) initiator: A device that has a VFIO selftests driver.
 (B) target: A device that can provide a memory BAR (vfio_pci_find_mem_bar(=
)).

So far I haven't found a single device that can do both. But you are
right that theoretically a single device could satisfy both
requirements.

I can relax vfio_pci_has_p2p_path() to allow initiator =3D=3D target.
