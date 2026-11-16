Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836056;
	b=bA3PWuetdJ2cf9PC9cexfcN7AtlUFyRoekuFI3rhcphJ3WEbOZZx2POeI9hsi25od/nr
	 9brkdSyi31A0KCVFiTHwG7PT5/8UdeC04RBuYZUhlrjbkypFHyzuX5JEHIKKVdqyrz7CK
	 SLjI2B115ZTSSNyXCKMJDEpxH/CJ2gNKIpHNVPJaI2/l7VTbOBfp9HWLgbocjkHqmoTrj
	 OKsxIAalL4SH1YrYobCBn/Tx3s3ZwDL/wfjWr8mgHnL38BLd6Eu+j186OUEMCe3Zyrrxv
	 u0O+whW9CkH/sRvCOiuGpuhDvLqTWZNiRt79KQIYQO89FGyZS5OCH9gmdmkWjPyifHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836056;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=kFki2hBsnHrC0juVnTO+KTiVDm5TzD8rtd8Do1S8nSI=;
	b=Ob3t7kOO3kxrhkocguXY01Ob74HgFO6UTM06fXmP++o4k5PHQkhG6phFAa/Xwnbtd8W1
	 rj9S6zbaGQV9HIFIan0RHuLdnbVlbhGWZHHlF++gpsoRPWQVuRFdHvXOtTs8xg7v6Z+TC
	 Ioqkta3e1k0aMziR6rdNdZSSnS8jGnOPLljFCytM47avccHGmwg8zFUuPl2jXaQQLDMun
	 86Kq0F6UTkOBdXxhvD3MUcAnOb6DRv1Kzkj7pXjQgt1o/DKHT6OGsDyT7E5tQI3edCpHN
	 SYPYAo1tUtvkX0RZzTE/MRIs8Z96JFbHB3eodjuUR5GX/G4DsULsRWtiyj1MwLu7Ktw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pFbPC1Zo;
	arc=none smtp.remote-ip=95.215.58.128
Received: from mta1.migadu.com (out-128.mta1.migadu.com [95.215.58.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD93606A332
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 13:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD93606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pFbPC1Zo
X-Envelope-To: linux-media@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kFki2hBsnHrC0juVnTO+KTiVDm5TzD8rtd8Do1S8nSI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794836054; v=1; x=1795440854;
 b=pFbPC1ZopqpV1uLfPZnpmOwwi6BPDJGiNoK0I6IRHOo38XPdU7yKf0cGRqys5I4PA9gyR1fK
 cS/Xt7eN8thRi7DCD4SngMW+f5NsMUiISiGo6jtDhLGCHamCTQJmymGWC4p8Xfuj4my/tiAVF+N
 eR97Jfm5AdZg+N4Ca0IeG0O0=
X-Envelope-To: linux-media@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d97d5e1a12688069;
	Mon, 16 Nov 2026 13:34:14 +0000
X-Mizu-Trace-ID: d97d5e1a12688069
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so7195e87.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 05:34:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFqhMgEo2/ZXQGO3CBnS9vk/tHLh9/TMUDbEfchyQIn37oCLHm/uaIRUl/DTJDa5UhNqKVwC6n10kD/4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lbilFieSqQKh5Ccqg4HeQ64HIgU+meiEOfX/d45/Ee7lJkWcX
	Xebfx83jmPJag5+Uq6VZIScuuLe+d2ZBtd+5iqHTT4+0Jt2Cm6dYM/8OBA9wjbfsW/Faa0YMRtx
	NXnUIu7zb7kBKtbdocACMUlJjwNhEOvsnreHs1X5X
X-Received: by 2002:a05:6512:3087:b0:5bf:b994:6598 with SMTP id
 2adb3069b0e04-5c17d98271emr226475e87.6.1794836047954; Mon, 16 Nov 2026
 05:34:07 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116091137.94252-1-aneesh.kumar@kernel.org> <20261116091137.94252-3-aneesh.kumar@kernel.org>
In-Reply-To: <20261116091137.94252-3-aneesh.kumar@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 13:33:31 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw7QzzkQYKV3jyvW5mqZQMenTfm=kus9i87tYqACDOv0Q@mail.gmail.com>
X-Gm-Features: AclHuK93q6K13zN84KswjEKi9cVQgC-Cy80dn3a2peCMzM1qEee3TapGEGzaKvg
Message-ID: <CA+EHjTw7QzzkQYKV3jyvW5mqZQMenTfm=kus9i87tYqACDOv0Q@mail.gmail.com>
Subject: Re: [PATCH v10 02/13] mm: Zero memory during shared memory transitions
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Radu Rendec <radu@rendec.net>, 
	"T.J. Mercier" <tjmercier@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, 
	iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, patches@lists.linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Aneesh,

On Mon, 16 Nov 2026 at 09:12, Aneesh Kumar K.V (Arm)
<aneesh.kumar@kernel.org> wrote:
[...]
> Keep allocations on platforms without memory encryption on the ordinary page
> allocator path so the original GFP constraints, including __GFP_ZERO, remain
> intact. Remove post-transition memset() calls that are now redundant and
> explicitly clear allocations on paths where no transition occurs.
>
> This intentionally makes every private-to-shared transition destructive;
> callers can no longer use set_memory_decrypted() to preserve existing contents.

pKVM shares memory in place, and a guest has to be able to share
memory it has already set up, as Vincent pointed out [1]. That was one
of the primary reasons for in-place conversion in guest_memfd.

Cheers,
/fuad

[1] https://lore.kernel.org/all/avro44jUWOARFzul@google.com/
