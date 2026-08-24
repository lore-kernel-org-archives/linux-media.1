Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D802B41A4EE
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575370; cv=none; b=UJUusE8a/OAAAD3LGQnuE4AiOLp0xAu9GiHaArhEn+q7sDURWRx4vfew8Ya5ROZJSGnBpYvPdgylmz7obZ5rav4cGcmoRcD8NIqOj33E6qFyNIbtZxKwZoi2Np86rbFULVg8JRnD78LaUs4IrlitC68gQ0xFubWT8bNM29PWjN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575370; c=relaxed/simple;
	bh=pBwaVH3+F4aywsHC/pUjnCRqPo1dtZMH1dC6s1o4CP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZEqdHFBNfGD1PlAXb4P7ny175BqRBxua4DWLiSyK04I1uqkNDgFUJNCXZ8iTF3m9AbM5oG+FC9Oyx7EGh5ND0VjhT+QXf3Mr1TVTKR/Uf1nwQiFeMjI5vztvq0wkKOdKzbAb3Ha23uC0E6HPBh4hDgz9oa5PPxer5/w0bTom9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXcN5yWr; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXcN5yWr"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso481308166b.1
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787575366; x=1788180166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzHfY6cefdCdPGqFyAr7rWtx24z4JIT/TgxLZWE2Czc=;
        b=HXcN5yWrSQQSX2BYCiSwY+TJ17P2X9I+8LolCl3MuhNgGyjVriAc4HDC5687TNAhAX
         QTpXe48pa7LqJb3cy7IuU4PdPXo+7tN/PRobYWJo52nOESEUpFhJqLdlWox8CxgqE0aC
         JzNJqp57feIwzKlq3KDmJ8ziaB7izbCILuiZqhmuvuFd2ej6DnkGUu+6gEPdr+1jzj5H
         05RNdMZ0FnW+T/WAWgoHAIeh+ddaNy74opS73ZOE+R0q6NAnMuIWX++9JXSn+oyb3xL5
         76NtgeaO7r2G+IHSMRr9x74wa+wigZctLv2ZRVMIHYZ0jI/LL/LSZ7/iMFHoQF3Wgo5r
         ZhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575366; x=1788180166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzHfY6cefdCdPGqFyAr7rWtx24z4JIT/TgxLZWE2Czc=;
        b=V4EgMVTyVWuGQOnyTR/IpUeQPpEeWoB/Lncrhs4uyckdoQ4+FGQ6tgVdNk5npQl0HI
         YdaYXRGgWrAkDJoAqnZMwnCN4G2zbX5tuyl/+d32fWtTk7zSZ6k97dByl/FXJFnt7+42
         KyurA02ecoL1sK/BAk75EuGdtUcotP7/jhUGbsTabDLpmKa2yp1Y06quLiUUB1HoBCHZ
         AciZ/J2Bxe0G8KPjrpWr1XxUsmco/xdJgI9CzfSPi/bIuQUA33O2TfAiOGmNav9xHX+0
         LAHkRQj7d4h8tBtfV11QXK4uob/Pnb5B7LHGaxjHlT+Mok31xZ3ojGPWrPLbx9llNjF+
         Ak4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpmPf4qXyDZFCzc6S+9mUH1YjzTbvUOBhw/iDwDCY7nuJ+60Nlfj0UkPJDqXlpUTlqFgmr3sdhtq28PDg==@vger.kernel.org
X-Gm-Message-State: AFuF++l3c84uG3kNbp01BJfxdHqSwIzK4xZjAtRXbnN0nNsgW577AWh2
	4626PkPScFd4caHy3I3YPB0LFVFOW/diqIUj6pfZWWmAxzYeKEFZXCev
X-Gm-Gg: AR+sD12mRZwoREzW+a5PF5Ptnpx2tAWj+1szy67qrxe0wf1JFep2Y6CfoOLcz/Slt8F
	RQ0ttO302UfLMtNadr5oML+A8gMJfWbYaLNJ6c6Lht7r47xuNjA3PPUWzWVwm6DJyoyE/Q6cQCQ
	3y9yvFl0jDcnCvjHzwjqePtCns9Ii/2aqvrTrqw3OJyR8Td2jF4EHfYYtODWL3Ns0OkVjYt2h4D
	kxTOw0G50bRczzJ3N9MVT9bvz3VwErAkwAr5FbnwJWuheMeV9NsqMmujIDHnwgEBwZCtVUbi10n
	lseKP0avVkH4UC/oTSMGTNhZA4hwehcBbQEIHC6TUIN/PBABWGrMpmQvjZ5JUrW2FmAgiYV06b1
	f0jymnYiS3lr+x6eA+5HNlG4idUL01r90QWAK9cwIC4kvtXfIwz49HWrHkhnZnKza1xQrY3K2QB
	ji0Xdt2UfPm62qsPMYchCHNT8VmePMN8duXgJ6UC6fezovpdjvzxxnPVZSgVeza59HZXa0Fa5Mc
	u+j1aOPwNUFz3YUWf2r
X-Received: by 2002:a17:906:f246:b0:c21:61a6:8821 with SMTP id a640c23a62f3a-c246a6cd384mr2373422566b.23.1787575365769;
        Mon, 24 Aug 2026 05:42:45 -0700 (PDT)
Received: from [192.168.178.84] ([134.19.53.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249689fa97sm1090754566b.57.2026.08.24.05.42.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:42:44 -0700 (PDT)
Message-ID: <b7e18a9b-2c1b-43b1-b62d-afca4659b4dd@gmail.com>
Date: Mon, 24 Aug 2026 14:42:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] dma-buf: fix fd leak when copy_to_user() fails
 after fd_install()
To: Baineng Shou <shoubaineng@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "T . J . Mercier" <tjmercier@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 Sandeep Patil <sspatil@android.com>, "Andrew F . Davis" <afd@ti.com>,
 Srinivas Kandagatla <srini@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <CABdmKX1-0bXdU_pWKrY3LR4JmOpxC48ka9akS8PHYDBnngFqWQ@mail.gmail.com>
 <20260817050457.1005285-1-shoubaineng@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20260817050457.1005285-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I've gone ahead, added one more rb and pushed the result to drm-misc-fixes.

Thanks for the help,
Christian.

On 8/17/26 07:04, Baineng Shou wrote:
> Several drivers call dma_buf_fd() — which internally calls fd_install()
> — before copy_to_user() returns the fd number to userspace.  If
> copy_to_user() fails, the fd is already published in the caller's fd
> table but the ioctl returns an error, so userspace never learns the fd
> number.  Worse, the window between fd_install() and copy_to_user()
> allows other threads to observe and manipulate the fd (dup, close,
> SCM_RIGHTS), making any "close it on the failure path" fix unsafe.
> 
> The fix is to split the allocation into three steps: reserve an fd with
> get_unused_fd_flags() (not yet visible to other threads), do
> copy_to_user(), and only then publish the fd with fd_install() via the
> new dma_buf_fd_install() helper.  On copy_to_user() failure,
> put_unused_fd() + dma_buf_put() cleanly unwind with no user-visible
> side effects.
> 
> Patch 1 introduces dma_buf_fd_install() in dma-buf.c (wrapping
> fd_install() together with the DMA_BUF_TRACE call to preserve export
> tracing) and applies the fix to dma-heap.
> 
> Patch 2 applies the same fix to fastrpc, which even had a comment
> acknowledging the problem could not be fixed before.
> 
> Patch 3 replaces the bare fd_install() in drm_gem_prime_handle_to_fd()
> with dma_buf_fd_install() to restore tracepoint coverage for DRM PRIME
> exports (suggested by Christian König).
> 
> Patch 4 adds a selftest to tools/testing/selftests/dmabuf-heaps/ that
> reproduces the fd-leak scenario (mprotect flip before the ioctl) and
> verifies the fd count is unchanged after a failed ioctl (suggested by
> Sumit Semwal).
> 
> v1: https://lore.kernel.org/dri-devel/20260703080922.1838362-1-shoubaineng@gmail.com/
> v2: https://lore.kernel.org/dri-devel/20260710105740.3080070-1-shoubaineng@gmail.com/
> v3: https://lore.kernel.org/dri-devel/20260714114654.3885457-1-shoubaineng@gmail.com/
> v5: https://lore.kernel.org/dri-devel/20260730062645.233148-1-shoubaineng@gmail.com/
> v6: https://lore.kernel.org/dri-devel/20260807101140.1357218-1-shoubaineng@gmail.com/
> 
> Changes in v7:
>  - Add Reviewed-by: T.J. Mercier to patch 4 (selftest).
>  - Add Acked-by: Sumit Semwal to the whole series.
> 
> Changes in v6:
>  - Rework the selftest (patch 4) per review: extract a count_open_fds()
>    helper, fix the copy_from_user() comment, fail (not skip) when the
>    ioctl does not return -1, drop the bogus mprotect-race mention, and
>    reword the result message.
> 
> Changes in v5:
>  - Add selftest (patch 4) reproducing the fd-leak scenario (Sumit Semwal)
> 
> Changes in v4:
>  - Add patch 3: drm/prime: use dma_buf_fd_install() (Christian König)
>  - Add Acked-by: Christian König to patches 1 and 2
> 
> Changes in v3:
>  - Split into two patches (dma-heap + fastrpc separately)
>  - Add dma_buf_fd_install() to preserve trace_dma_buf_fd tracepoint
>  - Add fastrpc fix using the new helper (T.J. Mercier)
> 
> Baineng Shou (4):
>   dma-buf: dma-heap: don't publish fd before copy_to_user() succeeds
>   misc: fastrpc: don't publish fd before copy_to_user() succeeds
>   drm/prime: use dma_buf_fd_install() to preserve export tracing
>   selftests: dmabuf-heaps: add fd-leak-on-EFAULT regression test
> 
>  drivers/dma-buf/dma-buf.c                     |  20 ++++
>  drivers/dma-buf/dma-heap.c                    |  80 ++++++-------
>  drivers/gpu/drm/drm_prime.c                   |   2 +-
>  drivers/misc/fastrpc.c                        |  16 +--
>  include/linux/dma-buf.h                       |   1 +
>  .../selftests/dmabuf-heaps/dmabuf-heap.c      | 113 +++++++++++++++++-
>  6 files changed, 180 insertions(+), 52 deletions(-)
> 

