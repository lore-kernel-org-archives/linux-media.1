Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D061E49E13A
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997163; cv=none; b=mqUa4UwMnswSXlbU/ocKWQ1VQhcfaUbY47iFYApTleizY+hveiBaKZh1evVU6KAwOpN9VToLOqupfBYZXWBnplpFLZw4aEczbwkBXtRBihUk//VbH30Fz3sBnsBwy9syG3N4lsLYybglthDN8U03Inoi9MX8xxsVKWYB1n05idY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997163; c=relaxed/simple;
	bh=jI7O6dwFsIzcl16MuxgQK+8Hj3EPC7adm8Q/IYAxJFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jT96eLGKqUlgaWEtBAL8mAEjq3xW2LXONBSxMK4EQPxN5fmPkbyXGkiC/nBcDpXSJYDPnoqxg5BslQCWA9D3UzZYTFWjj4fU2Fi8LvzD1hHLT0mI5a581SJvrpFU5d8Lasqy/g68HrTbU3zPwbrca+Mtsld6NLMtedaVisLy0UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Qn8N0JVJ; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Qn8N0JVJ"
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c67e5059f8so841314e0c.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789997160; x=1790601960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jdn4c9lGyFJE/+rps4rYYBXSqoAaBa5j8WwP9obCXz4=;
        b=Qn8N0JVJyO5GjQxFLgZn1BQqq+hEFnpT4XTo2OP6jStKvSzF/fmEKMPfM9sMX8+JG+
         3a30NIR53CWkQV3oQlyWGEU8Xgf9IXRNTu27Vix0Sm3zXX6FqQYMeNVQMHEJnCB2Z7z5
         rppPhTnNjirk/bWXGQ5yjO7HqIBbZ65RLmAA/gWHlS3LOBzSPgvhveDnqZZG2XljQMDE
         WUrgH3IuEhYn8NcQP/n15qAYxBvwpCvUnH21hNcXB7QJQhsoFgQC1rOPq68W59e6LvUS
         PccoFlPN6+HD+8fk8JoOpL/YLv1+VO3fqF4wmCirNKyrso1CIamiv0t3XaofZ1M5+VmB
         zVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997160; x=1790601960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jdn4c9lGyFJE/+rps4rYYBXSqoAaBa5j8WwP9obCXz4=;
        b=JodNEUwekvmL4XL+gVh6R/NLdxQDBfkTrm9QywpO6HSDC1n/cku+yZN7NUgqEml0w5
         eodykocjOQT+v2x5TGKU6O6YNpkKDAR4C7DL4r/ymbhzhO0mhGKW4GXyBspRIfZZjycI
         nW1FCdFL1QQGUgfl/y1+j25VtaxJTcgmBbMeXxEkKzlxPSS4FzIBOFMPLS7a8NmXOkt8
         YHPnoPluZQqEP4XkIVsimcGPHFSB5Y33MbfW8M+K0R1IwTMg5WVg0MBofTNrg8NuZHd0
         Leuf31iQWIwVTkHaIW4Zpm05eW+RpTMrXX+mTkoCXV9FoE5kltocWtj/Y+UTkag6FtEV
         Mbkg==
X-Forwarded-Encrypted: i=1; AKwUvBxNEt0u+S8ZjGcKOl5cjxiT3/Q4MYSKEO+7fUAQ3Esb4Wly3sR2509SqrCROXgvnptj5dhtZwTA3QNh4A==@vger.kernel.org
X-Gm-Message-State: AFuF++nxuetblG9qBy2S7+CY7Ll/um41GhUKbZpHsRU0jqKN83IX1jWU
	GjCqwTd9EHZrs9MytWXMuJEFyaePBk3g0pOgM64Iiecbo0N79yw1ZTHpKdleO+6IPlg=
X-Gm-Gg: AYBFou31qyeyZ0HlI/cAF40cMnLhkfQXP2Kk96d0lnk+/I3KnLOcrajy+4icP6iw0eD
	pnVOkLvfV1RIvI2ZiCdi8Bve3Fl9JxCMZlkiJ9eW8YHAhjDiC6mLXkqY60A+IDrLDQfqtQNqKSx
	TIH8xQg6fi/H1rgGw9OC6uqIqBBgPNn3MtESWuXaInPfDfffgnHbUfiWE7jj2OUqHW8SxcIm/b+
	JQTFV0j4EbiHRSJtb7qjmxOnRhzx1iJGg+BtBFlxUy4BumUDE6pRMhB3ZqmEhZn7pYYMK33mooB
	XIIy6iX8F+5rVPBkbN/cxs2AqPXwQyD81jGrChn/EG9LTLz1wvGe3k7z0xn101u3LKvwyxbPTZa
	Hk5yIeNI1/+CbNQCb3DZ6TZpj/rQYYqcUkzRkVG3V4mYuwU72Z5M7+oOYT0vq8cStdTXXGfic3B
	DY9hpv+Jn3BJb8iLISrlecPYwj7S7Dc5WvZ5y5+l9tm7K55L1slP5v/AMLZ0DvzJpnVCM/lCLdD
	yofkR3cwaLkroR3QpC8GA1QgfuhNlJVse9hVa28eg6gJEWymcf2SvJe
X-Received: by 2002:a05:6122:209e:b0:5c9:a491:641a with SMTP id 71dfb90a1353d-5c9b8a6c1afmr4625797e0c.4.1789997160437;
        Mon, 21 Sep 2026 06:26:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a60f21sm67324286d6.19.2026.09.21.06.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:25:59 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x8e1v-00000006Knm-1R2E;
	Mon, 21 Sep 2026 10:25:59 -0300
Date: Mon, 21 Sep 2026 10:25:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v6 18/18] RDMA/mlx5: Ask P2PDMA whether ATS takes a
 direct peer-to-peer route
Message-ID: <20260921132559.GQ11599@ziepe.ca>
References: <20260914-fix-p2p-acs-v4-0-v6-0-5ef07ec9ef06@nvidia.com>
 <20260914-fix-p2p-acs-v4-0-v6-18-5ef07ec9ef06@nvidia.com>
 <321890690ce83d1943b2f678bd9bee9b8c895b66.camel@linux.intel.com>
 <20260918121500.GV13683@unreal>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918121500.GV13683@unreal>

On Fri, Sep 18, 2026 at 03:15:00PM +0300, Leon Romanovsky wrote:
> > That is, a flag to tell the topology check that some transactions
> > *will* take the host-bridge path due to IOVA being used, and that the
> > computations including pci_p2pdma_distance() need to check whether that
> > is possible (checking whitelist etc.) and return the corresponding
> > THRU_HOST_BRIDGE mapping type. Translated transactions taking a short-
> > cut using the bus-address would then be hidden from the driver.
> 
> The word *will* puzzles me. As I understand it, if your device has ATS
> enabled all the time, it should always get THRU_HOST_BRIDGE.

The P2P subsystem currently does not understand ATS, it assumes the
device will use untranslated requests and makes the routing
calculation accordingly.

If the device knows it will use ATS it should ask P2P for an ATS path,
and P2P should only return THRU_HOST_BRIDGE or failure.

The purpose of involving the P2P subsystem is to verify that the ACS
flags for the ATS translated path are going to work. There are many ACS
configurations where the fabric will hang :(

For something like mlx5 it is ideal if P2P chooses between ATS or !ATS
based on what provides an optimal transfer. eg there is usually no
reason to use ATS to access system memory for streaming (ie non cache
hitting) transfers.

Jason
