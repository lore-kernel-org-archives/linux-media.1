Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC3B3C5539
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 20:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784148278; cv=pass; b=uSWS7HUgkQ4DamVy4nxVSaNYNr8gGQ9BmdM5DaUZ0asNy7mbfhpbgG009sbA0/x1vinrFaUREf1AhlfH7NAC2WYElxFG5D5YzQLvJKG0SD22q+dT9xGqMi1WhmtmZcn8tA/GbxUdzPhcw4QG+JBPSLE6t00uMseW1SnuUTDMJqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784148278; c=relaxed/simple;
	bh=uKutVTY39p0tACln7T4vMquumVH2p1fzakEzXi9+UDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaAlHyv13o0oGLC8bFgwpU9Fd0C3rVVQZAKOYziIc5WrN2YjuLibzNy3UhGwb/AGdFD83oI/i9gbnJect6ovX+T8za9chV8rwXghxo6SXLHpvjey5hWNvqY0AC2WoOzvKnxUgr1cPZco0zHI1d6aVN/h3Q2MAJHh2y9bm2SxIlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vMQbO8si; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vMQbO8si"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b8d99342so5175e9.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 13:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784148275; cv=none;
        d=google.com; s=arc-20260327;
        b=YO1xcljl8vN+/w6dFK1fcj44/hsE+nBDhy52GR/Ne+BeN9igkXHDj53Y9/1ek/GsFV
         TfvL6HN2r9vzfjPLaTJRzOvbaccbFv4ocbDwYlhOLS/PPOMOwlb3UZxg+K35gcTaRpyl
         tANIPR6DzBLGWrM2I2PdEoE31kwHwBgr3KDq7pzQHbxjRm78AiW8OzleDOF2AvsQb61S
         k0zPLzIppcbx9blzWiG9gzDZSCLHSc/6SyJ3avZKlChPBD6uv9+BVDwktGkC9aoIk/j5
         N8delU+oYkgYlbMqKfQKynday6EqeUncV2waRob2N425hOhIRRYND6JXSf4QxbirbnG+
         zoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hz66rWG1l8090hWA3QPVjjyCjLvMjXWnoSa5qVyf/ME=;
        fh=xWCtrM0DyzgHiwPFilW5mlpNAjK/v2+16YFV0UD5ZQ0=;
        b=CbvG9fYECU1wdEtNQ9Jlrf4WN1R77RRIcrvZnu99zOXKTfcxCWuIBxI7KjVusbauYs
         0aBd/NPuDRh+K9u3GdJPrl2SOd8f0Wr4Q/FB+zvMC0CdhfRYrO0xMihJ95W4UuN1AZlD
         u/5q3XgGJTKfKxJLHpsJKdD1sVSOgFNSJPtzyKHUSWlfI+mHE3Lyvq88JY7V6pl38cQV
         Kv4lt5rGVqzAAV+Vq82wpdvdx4i5QlNLif75jr2j8ob+Hu1EnvHw5fSjKIXdzXHKCHKb
         ioDY+hrz45PUpMp50OyLdJ2wYT7A9Re0t1MD0ldvUqz0QNQ+QvDMOxFpXd5jp06Nay4t
         Xpbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784148275; x=1784753075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz66rWG1l8090hWA3QPVjjyCjLvMjXWnoSa5qVyf/ME=;
        b=vMQbO8siYryrHz9uC+cIXn12CxECZJgEZWjnlJuaTeu6Tr18uliyzfh60ItZ+q2J4d
         4Gdi4Hd1DTaT6RxOZP81okPwrKohv8TjP0u+Z+5b/9l6ea7bEkZMseugK20DfjMuAx1R
         U5Wyr//dI1kCzzWchMp+dI5n7lbW4EOGG8GcsKblO85JCCwvGoX3a16d8SlfccNB3+Xq
         QXkSDfaM5IQ4+ikCsBWPiP1B7B+U+nJxrE03i3+zrvJE9j8Ug+Pqh+RYF5PENBaJqIsz
         CzblFn8eIy45YVSFOx9sDM84x3wKQcKVesPsEIDi0e+c/vGNde8Nlu7Lgt9EeH2aiAyK
         O5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784148275; x=1784753075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz66rWG1l8090hWA3QPVjjyCjLvMjXWnoSa5qVyf/ME=;
        b=Wk4vOcmM6dZfnkOS3lx1b7ipD1X6Ub+FlDwDd1mHhQNxnDCO+K7up/yXPRiFMtfpTK
         +kYiEt/LbiOoXGbO/ovaykjGGl99OeD0E3FnLkwrLEbLggwHe42fdf7GUm2a03RTxr6D
         JhaB2RK52mBbE985ldnzYkyPslrKzI4vkTU4mBmdbUScKnFfyNaX8AVpDwclVOLDKEnZ
         rQJE5RgYogcnglO7bKJLgoHgr1NzNp+oVxSS/BbMUoSWBBev0kNiOrpyUc2ZrIHFYp30
         Z4F+DxWFpj+XEZpTjbJazUJ07GdZ4YUwHAplEEKn3go21zFz2zVOiD6x6B/Zc/8tqop2
         to6w==
X-Forwarded-Encrypted: i=1; AHgh+Ro7BDHyOvmQkNCtlX5b6LhQl+hG/AN4Zc0Rc+Arrix3nqXxduMsxgXA0hJE/yCn2sln8A4C2yk9PjCgzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4+0oY26kHVlHv7ZjMJ+2OCa+HNfTdwa0SiVq2mao6Tb2JVfbU
	b9S7P7tkV2FskWXqZ0Po1tNZy+fkeOf7mzJnwH0HYnK3JUnhwDg2EdOTrg+sXLmcQHzwEQXVDDG
	FvzeY/QHNpNHhBB0s29TYMOa0XogTuRNhTKrc/3uE
X-Gm-Gg: AfdE7cmwCwoauWAvygbQdPqFHd35PVssFHkfm4dvwhW1Ctcb4kS1LiDmROl7z3Y+pKM
	MM4W7QzXciAIU33bNP1x115rnF38ztFvElFI/UEVMfFmNZVkg7z7smofG6OFyPFtJxQpl2LK2kG
	w3ufqbjHsEQNKpMUhcOh0SV5HQFFA0lpS+cyqwO7tvRtJYa9ulv6yJXApoEgJDhrWtbgsG2BGEz
	gaMbE5z8vkMzYDSKxAfnWtW4mVxv9aBHIsrPf1CNM5yx4uOeo2U/awU93RbSa6ZTOJIctrd1S1S
	QisbbJaVO1FDjWJb7+gJvNaIG8bj+JmhGkQmFzE6sIFuEdJYXGcUHLBbCjs=
X-Received: by 2002:a05:600d:8494:20b0:493:aca0:32e2 with SMTP id
 5b1f17b1804b1-49541e54d4amr246495e9.4.1784148274578; Wed, 15 Jul 2026
 13:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
 <20260714114654.3885457-1-shoubaineng@gmail.com> <20260714114654.3885457-3-shoubaineng@gmail.com>
In-Reply-To: <20260714114654.3885457-3-shoubaineng@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 15 Jul 2026 13:44:20 -0700
X-Gm-Features: AUfX_myDNkkGbyCVobnhwftgr4bKDJQunXmKkyEYSc1ZZ6YoWywnkOQfYn032aQ
Message-ID: <CABdmKX2Uqw5nr3-nrSAVHGt7Nij23Mt503DBhbhKT9suN_vm+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] misc: fastrpc: don't publish fd before
 copy_to_user() succeeds
To: Baineng Shou <shoubaineng@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Sandeep Patil <sspatil@android.com>, 
	"Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla <srini@kernel.org>, stable@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 4:47=E2=80=AFAM Baineng Shou <shoubaineng@gmail.com=
> wrote:
>
> fastrpc_ioctl_alloc_dmabuf() calls dma_buf_fd() which installs the fd
> into the caller's fd table before copy_to_user() copies the fd number
> back to userspace.  If copy_to_user() fails, the fd is already visible
> to other threads in the same process but the ioctl returns -EFAULT.
> The existing comment in the code even acknowledges the problem:
>
>   "The usercopy failed, but we can't do much about it, as dma_buf_fd()
>    already called fd_install()..."
>
> Now that dma_buf_fd_install() is available (introduced to fix the same
> issue in dma-heap), apply the same pattern here: reserve the fd with
> get_unused_fd_flags(), attempt copy_to_user(), and only on success call
> dma_buf_fd_install() to publish it atomically with the tracepoint.  On
> copy_to_user() failure, put_unused_fd() and dma_buf_put() cleanly
> unwind without any user-visible side effects.
>
> Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
