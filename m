Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794589208;
	b=wGFNPcdV05mfkPEDnAbQbhFPJCraBlAlQZoDi5EiX06XAgoWyJEoZrawcTBQO+CpBq0N
	 kuVHOgeB2D3yviP3Ka6/ilUSr8CpheVEsgsYio54HMVvbZ0Q0NgxcbovQ5A4czqC3O/Ms
	 XuMsl3ljHhUSi+bth/U8Wc2Rm80F1oqY7hMJB5366inEWujLTKLZoYkdrZgQ2My+jwe57
	 hGGAWtiAmLMrm/0H9ZnTNiITWX9Cxv3iciugaIqhyBR4ykU+IeYrVU+6ebkYe767Vf07t
	 rTdNe6i57nRyIUjVqDLFJLwdIYTPMuAaAMnl77ss9wqWoYEdLPTJJfAKwQ6zX+fiBNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=scUARIYa6JlZqbM9o9X8UDZhtH4UB7ysOYNW/jveLZY=;
	b=jyJx7xUGUyy61f6dYWl3ixIu9iiOG7wbp7FhWCqRiwFsEil0s+DKqDgKVIA57hQVDEYV
	 GeUfz9MKYosa0d3p/08rZHrVzw2xOz0Zy+4FS+WcCK4kJbnRIKxHNVkWGqBmUJj1dW9p5
	 2plkxCZB2Z4CnXTQEKC13DeShPW9EW2yOBJHSazkY11rgqgrStwiJ86hFnqGmWbYvJH4U
	 AQhtBdbsMNVPwITpeAkHeMNXl6iVIoeFwaDSC8prUOeNbejhqc1DVEPpOYIVZWTDwTkgB
	 gcvIvMmXD1esGJMXSyE3OKj0xF4n1pqOKftr8QwvgZZA2pI9osZyZA++4CnWsiTRWDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZBf70J36;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F9A606AA33
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 17:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F9A606AA33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZBf70J36
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso128035e9.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 09:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794589207; cv=none;
        d=google.com; s=arc-20260327;
        b=EjnP/Ex2/8+juqkFgsW9M78poc4Sv0Ig0VyTTDE98NktKBXTP28OUJtY0QxVEirmHu
         7EHtZqjBAIiuZogtIWQJxhEJ5XhML1XVZBc4UmJb60BTKH/37h+u9KU0kWS2gqXdiAX5
         ZVwqICsMQfLhmZvtKA+ibgGtQxucXqBn2ssF5r3JstRR1ukkxmBnLaKykvc3EahKyEjG
         9g8Sl4YYwh0x40COHdu4klgaddG7jAY6OLIdcP6khU+lhCzq2FGOCsH+JGoexfepxWeI
         CZJ7thk4iuePxpAE3MPGyTZ93XkQhXOP7SDON0ilrr+4z/ajcw14LYeWnNe6gMiIZCio
         o2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=scUARIYa6JlZqbM9o9X8UDZhtH4UB7ysOYNW/jveLZY=;
        fh=KSbtyVtELmtox7Ajg2Crd5G+1OSN0DDeimPlRC1c0Bo=;
        b=aiQSirfFVKTddACyev7DiAYXWISnSQ6geW3I0dmapizVuwKtHvUR6DZN1w0s8NZzv7
         SKq0qvNJTI54qTdfT8VMC3Kf6IFaudIZjtUn9Teu7JVp4hgdNCA1USo4iD245hNijC8X
         1QRccRVMjajAVRep63vf+VWl1uxT9Upnfw92m97xL2XmYs8ja5c4RBXRQSfH7Gm/9feh
         KM56Y0gQ8Wad60T6JHSyJ1IKdlvXBPElkxbaL8aDFj4ziOVTQDAtvLDpj9Qd0BTZPCKN
         XXkTapL3oWtZqgN8YqZ3GKTvzQic87djDgHoTwTEoPErMybizNa9hBWyPJgaYPw4x+R8
         zmYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794589207; x=1795194007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=scUARIYa6JlZqbM9o9X8UDZhtH4UB7ysOYNW/jveLZY=;
        b=ZBf70J36PbEu4eQ+SNTy5zuGy74PhNTaJdDpje3jNp4bPngtmrGES7egt+vv9prBpg
         4L+4nnjiSSDwLYLRb7VYtr1pG7rqHFuj68TMPdxGvi+d07fbBK72knjwosg+tvLZVmV/
         7yap3Bwfb0oJ9CEU3qPJ9EtDfvRM1Yp3YX8PCWJE5guWzcu5Prz7Ua7WjmgG4Mk/toBa
         OyMSpBPdjlTPUD5hAB+9e4VyPGoJmII+Wms0dgUdh9QMy7xYARZvhjYiSvZCgVPHfDAO
         PnPRn6RoneZ6phOLPC7VAO4v53np23+EF8R1aqe2QwPx+QontsvLjdFsMHt6PuDpRC6G
         2xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589207; x=1795194007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scUARIYa6JlZqbM9o9X8UDZhtH4UB7ysOYNW/jveLZY=;
        b=IPf2V33xgdv8DZe/6jEiN5BUYktb5MwE5E9urQf1Ye43C/e8qNko46bAiyCeqHY9IV
         LkjONcQMpUp8hGIM8+kOmotBpbHCojPDA/vfBh2pl5x6yIDK4GuLIvA3Er6clz9ah+jV
         L7Yt5oEhGpa0EgaHIfxwnPUsqKzc4Gt0ytyKsm0xqHo1DDz7VKmrTObA4YcS3v9HC9+Y
         MVYUjbolvPD4NUWZtU2XTLe/UfkhZONhDEe43x+omQV/cG47uSySwUwno+V7bqSJ5W6O
         yORm2U2MuqTZGSB7ocrdt0jIVEF6VLlZYmDGFpakx064prM4ln0/U/Yx3qH0rv6DCBTy
         CbSA==
X-Forwarded-Encrypted: i=1; AL+hErFSnwqaI7IGWGci3Qroi5ULlfDOZrTIII3ZWwpjtqEoKveVkaf5mz+iy5xZJXhXgMS4Gmrf/7BGl2Y9LA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8S6p7OyXeDvzHfbef3FzBQBkjoZjfukpcugWeBnJE5xnE0mDwv
	PREpGHf1zAnmm83rfNIDiDKv1Y74K14BSZoxWF2h8geYq2sXKq7HVa7m+9tndXjam4wyOiX8xzF
	onafAc8INvwKoAeoVzfrashCEBbBEF6OAtamx78Qb
X-Gm-Gg: AYBFou3ggcbcuvDWi6q+EqjuHwCkts3a0T5HRs5mmLCZ8Y73CE6WVOM8ooA9rGvms9K
	Y4JWWQdc3PniWTfTfxLvsNeb28IARdeBk6LUPRkICHF+b7Q2HwULhShjxOuxUFNKihFSLoAnwxk
	bQdnoE4qYyMnFOi7nPkYY2lZaC6OUTTYdHIbl3g+AdngVqlCPfP+jPNM6SknHEtKS+1F5+3pCrA
	tBEt3qtT7up6NNUAaGUgm7HJu0D33zLGJNWAxjDPqtCYy1a8JkScN3oMrY6G3rCsHuWh7O1jpG3
	zJxCVvNl7X3kgzIe11Wp+SV1LqaasU5z+Wj/UsgeUbDsUXv1dbf+CeInczPBnxfruTRB7SztX/W
	aKEHOCpdvXx966Btenn6FBRF82WQwRESKIFrGF/fVjc+zzonZmI1atEmm7JZk+qWkL5/NNZqyiH
	IENVcnRKLuMuR2h02IaC8MApg1
X-Received: by 2002:a05:600c:870c:b0:4a2:ba3:236e with SMTP id
 5b1f17b1804b1-4bb56e56238mr936435e9.14.1794589206285; Fri, 13 Nov 2026
 09:00:06 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113024447.922683-1-k.chen@smail.nju.edu.cn>
 <20261113035640.948458-1-k.chen@smail.nju.edu.cn> <20261113035640.948458-2-k.chen@smail.nju.edu.cn>
In-Reply-To: <20261113035640.948458-2-k.chen@smail.nju.edu.cn>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 13 Nov 2026 08:59:53 -0800
X-Gm-Features: AclHuK9SEKgiz7MAOQEc_T8XPTeLCyBuqWo3mPZz76potYWEjTPup_06Sl92Rh4
Message-ID: <CABdmKX1AskqjkCcL8Xu7zqgoBCeXjoeRuQggFNxq7ktSo+ij3g@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/2] selftests/bpf: Test that a drained dmabuf
 iterator keeps returning NULL
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Yonghong Song <yonghong.song@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:57=E2=80=AFPM Kang Chen <k.chen@smail.nju.edu.cn>=
 wrote:
>
> The BPF iterator docs in bpf_iterators.rst specify that the next
> function of an open-coded iterator should keep returning NULL after it
> has been returned once.
>
> Add a subtest that checks this for the dmabuf iterator.  It drains an
> iterator, calls bpf_iter_dmabuf_next() once more and checks that the
> result is NULL.  The dma-bufs the test creates keep the list from being
> empty, so an iterator that starts over would return one of them.
>
> The existing open_coded subtest uses bpf_for_each(), which stops at the
> first NULL and never calls next() on a drained iterator.
>
> The selftest was originally posted by T.J. Mercier in the v1 thread:
>
> Link: https://lore.kernel.org/bpf/CABdmKX09vLG4U-7FwF-vm_iTy1AjGUPXka08Kh=
WE+qJ0J=3DXGMA@mail.gmail.com/
>
> Co-developed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>

This should be:
From: T.J. Mercier <tjmercier@google.com>

<unmodified original commit message>

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>


For example see:
https://lore.kernel.org/all/20261104-v2_20230123_tjmercier_google_com-v4-1-=
1819a017000b@redhat.com/
and: https://docs.kernel.org/process/submitting-patches.html#from-line


> ---
> v3:
> - Add T.J. Mercier's Co-developed-by and matching Signed-off-by.
> - No code change.
>
>  .../selftests/bpf/prog_tests/dmabuf_iter.c    | 19 +++++++++++++++++++
>  .../testing/selftests/bpf/progs/dmabuf_iter.c | 19 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools=
/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> index 1a5dc1adae73..c1f81b5dccdc 100644
> --- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> @@ -265,6 +265,23 @@ static void subtest_dmabuf_iter_check_open_coded(str=
uct dmabuf_iter *skel, int m
>         } while (bpf_map_get_next_key(map_fd, key, key));
>  }
>
> +static void subtest_dmabuf_iter_check_next_after_drain(struct dmabuf_ite=
r *skel)
> +{
> +       LIBBPF_OPTS(bpf_test_run_opts, topts);
> +       int err, fd;
> +
> +       fd =3D bpf_program__fd(skel->progs.iter_dmabuf_next_after_drain);
> +
> +       err =3D bpf_prog_test_run_opts(fd, &topts);
> +       if (!ASSERT_OK(err, "test_run_opts err"))
> +               return;
> +       if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
> +               return;
> +
> +       /* The test buffers exist, so a restarted iteration would find on=
e */
> +       ASSERT_EQ(skel->data->next_after_drain, 0, "next_after_drain");
> +}
> +
>  void test_dmabuf_iter(void)
>  {
>         struct dmabuf_iter *skel =3D NULL;
> @@ -315,6 +332,8 @@ void test_dmabuf_iter(void)
>         }
>         if (test__start_subtest("open_coded"))
>                 subtest_dmabuf_iter_check_open_coded(skel, map_fd);
> +       if (test__start_subtest("next_after_drain"))
> +               subtest_dmabuf_iter_check_next_after_drain(skel);
>
>  destroy:
>         destroy_test_buffers();
> diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/test=
ing/selftests/bpf/progs/dmabuf_iter.c
> index 9cbb7442646e..d5421b75c39c 100644
> --- a/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> +++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> @@ -99,3 +99,22 @@ int iter_dmabuf_for_each(const void *ctx)
>
>         return 0;
>  }
> +
> +/* Result of a bpf_iter_dmabuf_next() call after the iterator was draine=
d */
> +__u64 next_after_drain =3D -1;
> +
> +SEC("syscall")
> +int iter_dmabuf_next_after_drain(const void *ctx)
> +{
> +       struct bpf_iter_dmabuf it;
> +
> +       bpf_iter_dmabuf_new(&it);
> +       while (bpf_iter_dmabuf_next(&it))
> +               ;
> +
> +       /* Store the raw value; the verifier would remove a branch on it =
*/
> +       next_after_drain =3D (__u64)bpf_iter_dmabuf_next(&it);
> +       bpf_iter_dmabuf_destroy(&it);
> +
> +       return 0;
> +}
> --
> 2.34.1
>
