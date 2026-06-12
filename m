Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B08125B0B2
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289576; cv=none; b=glaTIJ1WoIVP4/eJSj22sgBhKos6dcEkIEfTtDm/irKUYODW7NRE4qovDJly3yXCcFIkRoFKU558m3QH90OM8jjuk+sQe6CZeSk90IIYsSYElTW/0dXpy1vaItzCxMX7941m+LUi0Be6AXe8hncokJXbRHxoMnfbLbjdVNa5zmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289576; c=relaxed/simple;
	bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mrRklWFlvb+ghbI3z77HjKegiFjYn6TsWMDtSWdPVxx698xlqZ9nIbRUyyFCe7c6+r3Hv+dr5PQ1NH7rRhogdqz61hvJ1bfdS71UKImkq3pkKhMT6dKsmWweSTC0/tIpZZ3CquAMNo4JM3oCfRXGugHLa8Nmips5n1XLoPdt11c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gJqWBQgO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OxBnhqZs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gJqWBQgO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OxBnhqZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781289574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
	b=gJqWBQgO1fNUmJ5E/GXTE7jw1xKsYo76pvJRmcu8r0dBrVhWfyN94F2gZLnzjHI8ItueSm
	iMLSwKXoGt8Ef9nWBOlDbuCtNVhSw852gM6koRIL0dH2xdE4w0Pq9gcxpWnZIHfq+UqEua
	2Ot7szzdZEGCr0eTMOmUSYQjpUMwqic=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-9J28VKYmMa6F4Si8JTYgrA-1; Fri, 12 Jun 2026 14:39:32 -0400
X-MC-Unique: 9J28VKYmMa6F4Si8JTYgrA-1
X-Mimecast-MFC-AGG-ID: 9J28VKYmMa6F4Si8JTYgrA_1781289572
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915767b341eso119469485a.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 11:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781289572; x=1781894372; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
        b=OxBnhqZs6Yd+qN2nrbA28I4g//orkDikvhyWy1YjWsIPbWy7XdDt7QNNnc1+l2oQ8T
         SijspD9+bIgB8Nlhir9JJeKChIYZTh35U9K223tllDUC35Uh3k+Jl2axW1AdynjtfxL6
         oTQFhVFdOrcL/P1kx8v5+6f1IeHHK2/WOaqneyK1nfKHUZMyrqOpTVzoKH/EF+NQfBVu
         Lxu6IlvCXOFTTlWgLXMplHfmxP8JzkER4gimflNIBpFRoWc9aXKQbDYo7fM0tpzBtDKb
         ZxikA7oGb8sU4TXH2sZmLjeaDNMh899bks/uLRet049ceCrmZ1lrPZuJ62RS3rMJGrva
         7FVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289572; x=1781894372;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
        b=qkc2H6IWxwseCAxpEP+9s+Du6WIVnHDgGKJmae/k2DeIAT5W6Kr+IgY476mEMbwdNw
         al/SfOX7t+SV32Nqb8VYLcYFboyKVUOSfmGv2rkQFLYKa68Dm9rty/aoWYFx4wMXtc2B
         X0DbGpVTbmCNlUCN4QcmkpMYEI22LTcOAfK+ga9RC//h9dVaAMuqbLZaXktumYF1Nc5k
         ccb7Y0+rWAPsmz/nCDfySdA8J2wd8bcCnfp5k8nTLMnrWLLrqoldurkK0M4tZ/6HoYAH
         8nUM7oJRAApRE7e9CzX3nJCBRwuBt5PICfR+EAWcl1xELKOWuIvNLUgFEvhrfwHeQl+E
         YzcA==
X-Forwarded-Encrypted: i=1; AFNElJ+4i7maSbBZI3n+p3O3YYlvuxEeY4qke3Cm7iClhG7pizHbkQHnxdPBU3MTipEQo/5XfKXSKG0xWVk1Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIGuOJbVfWziMtE0F2RJJgpn1aILiyPZS7LMpmNev3mq/NvAyp
	C7pevDcfujOEzdHf0nEoTlJm91SYXu8SQYlxIkJzmLOFWM6wXTV15a5JMym5aOMeDwmZt/cB0vn
	GfqOyH6H7SnDNrhgsx55fY0C8PY3k2owlElqwAl6LinNvDu55YVP30M0HjKhXK6hw
X-Gm-Gg: Acq92OG4l1p7ux9Ivo48GmTxbi4QSs2w8h9j68hjARNjUVhqJDpoyUKH0KoKpBXVt4d
	JHseOHvUHmw1ta49mXDLISPqzJgBNpF1utDTHCqoAr+wml5duHtsdRA524W07j+TQCYHspiI+0i
	UjGW+e5buz461my7EfZfzsVtDZ8QSDRYq28XaydZmwQfRHWx3TL83ctY01m9Co/q8yZlUAfjxkb
	LLOLE0ttNVUL4ZqBytUH1FYHyR+qDJpH0g6QJ2Gg5hJc9D0TFSd3XTiVaVvN9wO1EfjhVIRZJ5/
	1XjBwR/5K8sZyc8Hfvn4gXy0PW6/dOclc9aBuZerqTGiTbXRqVHV1dP3eJ91LFYD14AoAUkqYsh
	I7UH7L1Aqpa722X4lPQ==
X-Received: by 2002:a05:620a:8012:b0:914:c032:5870 with SMTP id af79cd13be357-9161bd604f9mr617289785a.38.1781289571994;
        Fri, 12 Jun 2026 11:39:31 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:914:c032:5870 with SMTP id af79cd13be357-9161bd604f9mr617282985a.38.1781289571521;
        Fri, 12 Jun 2026 11:39:31 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a03d6fcsm272275585a.35.2026.06.12.11.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:39:30 -0700 (PDT)
Message-ID: <da0dd5cf287f8739d6b099646b3fb98153670f3b.camel@redhat.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v20 2/4] rust: drm: gem: shmem: Add
 vmap functions
From: lyude@redhat.com
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo	 <gary@garyguo.net>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, driver-core@lists.linux.dev, Miguel Ojeda	
 <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,  Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin
 <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org, Danilo Krummrich
 <dakr@kernel.org>,  Mukesh Kumar Chaurasiya	 <mkchauras@gmail.com>, Asahi
 Lina <lina+kernel@asahilina.net>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Fri, 12 Jun 2026 14:39:29 -0400
In-Reply-To: <airp4AHxiJKWn5tr@um790>
References: <20260610162433.923550-1-lyude@redhat.com>
	 <20260610162433.923550-3-lyude@redhat.com> <airp4AHxiJKWn5tr@um790>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-06-11 at 10:01 -0700, Deborah Brouwer wrote:
>=20
> Hi Lyude, i've got a clippy error here that "into_iter()" is
> redundant
> because it converts a Range<usize> into a Range<usize>.

Yep, that's completely correct! It looks like I was running my kunit
tests without WERROR and CLIPPY by mistake, which would explain how I
missed this :).

Will fix in the next respin in just a moment

