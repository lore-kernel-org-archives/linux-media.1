Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794500849;
	b=J+0ysRlKnTwJqE/JIEMJJSA5gLoE07w1Ttc2DK6FCyvp7IkUmQl20z9xNQkBCi3GLoER
	 Wko8ZXFg1pgrUzavejAKPThBT+O2bDUXke2ufmi9sKqCk5V4dGm+KrOhbUxwtwQGfwYEh
	 WyseLynZDvTQdyxP5ci39w6iPRhQM27bxaFYz1jk5PoEWIwV2mRMIvLVVfRQiVkW8hGi1
	 oS3rX0iSbfoSMo5Lz21XATDl+NreA2PrFFdS+aG2vAIcTXor9DCTQ8q5nrPkUcuSwLDRn
	 hkJGbzcLU8cFXGNpbJ61OH4ptFqCgnrsU2KsE4kooxP23nYugCyUEzYGPnk4PEEMEVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
	b=hqFcpTKTYJD0TUkHZtLzDT6dJ7jYl5kY85sXlFXKFsGnSS9UPcW067c6fkCMnsSbtb+O
	 8R9xu9dyvndK6OY6nd5lT4hYiKSIxo/LoztzQTnfp1nwixaYIcKuQqOYdsmdMICECtqQ7
	 6H/beuC3kVoBk/7oyxT3a1zyMX+WYpNjz+JeYkXXURqlqgOzeW5QpWsFZqdoJ+oDFo6Ra
	 o+2Nz1pS9IkgDVA76mfGf1GtwmEYZOix6Ex7oXmYLrQqDKLKiBAsS8iT0tSsVb45Cnx+z
	 GC5HvpRtzf5If7TVSXT/SuG53Vr1PwaArgrnW1Axv48T8tyCerxX1r/AOoV3gzyH7PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YcmCDyza;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD62606A327
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD62606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YcmCDyza
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso61425e9.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:27:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794500848; cv=none;
        d=google.com; s=arc-20260327;
        b=YjYTND72vD9uFtXx8GHpMlK688DHtb0KX971FpfirUZSzAHf7cCZpE7n4iQPyByoKU
         oTuddWrMaF6sQILHIfc0k7Ga7DutdkLOZGzOTya/l2ZjsVyIvq7y98OzIamqPPr8CZ8X
         dEqSbfPJX5UQBEYSegKpgZhQP6784vEbK1+kvOEZwpjcTqhaMf2UcnoDCd9vLLZjbskG
         RhqSo9Z1LINujbdP2kQzpWvIyOB0VqZ8zvm35Gl6IF5qG6+ERryGGNRu1YfGbJJahjq6
         YTlD/4dNmvWqWE9aTq9WLarpycYNWk8NAWzDTIxXT44pFyab+Dgt+Ah/1aaLs6ZRsy1y
         PdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
        fh=zE8WzuYr+xBmJyqc8MeEw8SIsAcd/oV+K8AIIVBHzsw=;
        b=H7zS7liXcLmAGp7oPowiiPUgKpR8A+gjscSvlq0dRhgAt9AEvflwy1gQHZrju3ty7u
         CA6xYg0+Pt17VqvaXFr7KuWYCa+WLPuqNmc+abLs8LuUZOPO1HMv4bdUYnkhnyUpj15q
         BOBFqBS1a2dCekyZcRNIPdhy+dJX+OS8Tg7Vs3Ubb1UmeywEXaHu0H0IuwncjdLnm4Qv
         QyOofE7WxKG0Pl6QaZ7MmE9zHD/W4z9P1znuP0sy1TVSy9zyAB4SfSgmq5nlukPfX9Oa
         4ONPNSWtwWP3n/Qm245L6asr/JO5pF5DiMVOVrVTRwaE6TVNlU/hcyv8YsSF21d+s3zW
         F3Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794500848; x=1795105648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
        b=YcmCDyzav8Nt9tsG6YB1qdzrsUj2K7xN0qRg6FjWZ85PVWjBDXTysbYRtMopeaGbHw
         3AD3NY7Klvu3c//cl4xWyT9uv9XZ/YXGR9E9IhVCPadmz4MO66ZCO1opX2iXapP6/oAW
         rtO+VtvjKI3UtJ9VnqFC+tm2nkYPOWL4ytG4YVF/EbhrczQOQcN6os3wrD4qT8Ih8wns
         9iFRpW+zxr43BA4tifJ2kpNVhhJvQbYNQfVQQLbcZpDT7Hl0lS70q9bjAg3WzVJsnTRQ
         f5B7HuJNmAZOpibG3xssCazggPBdHG8B4QJ6mGcJJJb8+oewtXsLgZxQ5gCpnjQ0hotN
         VoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500848; x=1795105648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
        b=2PpoFkfmUzxkbDvP0x4wtS2s7mzjL40hpxggbHlsezLu98uRycFCF26AA9JNeW/Op5
         RQl6BSVAc/uxGNViRiJ9edlFsvUKsYJM+MaYy3RRH+9d2Iu2Ac9gKSgHEhK/rdFFOI3s
         FYem0AW2t7B2N+N30Ai0p0zjnWwFDiyrwasVlDwAbU2G8Xrg5pm1JkRgW849rescuyhB
         WAWJVPm1dQj4WIAAXG2iuE5F1AurC+KCLGhooMWfb1Qz///C9moCcS1bNbTflRx5Benh
         HrqZAw3wxWOFTd8y8XsseImn9JgN/K8hr+ktUxDNmu094z83nF4eld0Af1wZ/3m9gGDy
         90jQ==
X-Forwarded-Encrypted: i=1; AL+hErFXJJOEzvklGZypyiYiywVMWpIbbof6/nsh3AP5uCG3rLiuK7MJVVmIeNmsGnmuMRhY+g7YEVdSoVsPWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kO/WLgB6ugPWXZKPTEfpsrpBIWYU1VdF955lvOJMZDK6c6GVk
	wjSFBJK3/n2JFWbHU22X+6bFCnrzHPuYMw5BAUH2KmWc+4jmZkM0P88dpYycFM4/XP3oWNHtWYr
	8HTZHmFlPW/mpWnnh6GNJ2NLUkfd4lxuW529mKvcP
X-Gm-Gg: AYBFou3urlMUdM7Oazyxs6fqR8+gk2yN/3yzo/feZV3nG6lYoNs6VaMSCh30o9p98Ym
	TaNOYwLQ1EPPbrEKi0DWxi7eNFODqLRZCm5iEydPfuKH5shJNi30jVkcP2Awqntk7eavbuwce30
	vey/6qwMRvEXVuKM6YdLT10jrgieoshkWcSYZpuhul7qSRTv/DuB66t5S1TpLk2+xW3IY816NNR
	0CeTuWLVuNQ5eLoImw2PDC84r+v4FeM7rRZ65kQUkWB9ueagL2/bNGifFRkWtIYsbOekrPNe/aE
	gNI+G6rRpWB7Ew9j/vxty4Wki40KlSdbOxDWzR6tXV+tZWIuVGw+ABqgaUBXw91aI+psE3ihArg
	Zy2BwtfWPBafmrKUMky7olPtTf8vZRk0b30wUjvKNIPAdUSXu8D/ei5oeFXa+rZYOBOxGkT+8w6
	nC1ZyHr14mLicxffRwxk97
X-Received: by 2002:a05:600c:3484:b0:4a1:d7fa:ae36 with SMTP id
 5b1f17b1804b1-4bb4f596156mr1132755e9.4.1794500847262; Thu, 12 Nov 2026
 08:27:27 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
 <20261111195942.1283060-1-tjmercier@google.com> <70c7192e-b9e7-4b06-9d78-38e9de85f486@amd.com>
In-Reply-To: <70c7192e-b9e7-4b06-9d78-38e9de85f486@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 12 Nov 2026 08:27:15 -0800
X-Gm-Features: AclHuK-uQbQFbW5RNXEONirv5hUwyDZLZazYVkX411MRAANXcv3dooeKp4V1qsc
Message-ID: <CABdmKX3rqcf-U7W7E+d79dM9H3VnwUjAH3Hv92MczMSmQauC3w@mail.gmail.com>
Subject: Re: [PATCH bpf] selftests/bpf: Test that a drained dmabuf iterator
 keeps returning NULL
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: k.chen@smail.nju.edu.cn, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, shuah@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	sumit.semwal@linaro.org, phasta@kernel.org, tj@kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:35=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 11/11/26 20:59, T.J. Mercier wrote:
> > The BPF iterator docs in bpf_iterators.rst specify that the next
> > function of an open-coded iterator should keep returning NULL after it
> > has been returned once.
> >
> > Add a subtest that checks this for the dmabuf iterator. It drains an
> > iterator, calls bpf_iter_dmabuf_next() once more and checks that the
> > result is NULL. The dma-bufs the test creates keep the list from being
> > empty, so an iterator that starts over would return one of them.
> >
> > The existing open_coded subtest uses bpf_for_each(), which stops at the
> > first NULL and never calls next() on a drained iterator.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Let me know if you already have drm-misc commit rights.
>
> Regards,
> Christian.

Thanks! Still waiting but no rush.

> > ---
> > This depends on Kang Chen's fix and fails without it:
> > https://lore.kernel.org/bpf/20261110125106.2935677-1-k.chen@smail.nju.e=
du.cn/
> > Kang, feel free to carry it as 2/2 in your v2.
> >
> >  .../selftests/bpf/prog_tests/dmabuf_iter.c    | 19 +++++++++++++++++++
> >  .../testing/selftests/bpf/progs/dmabuf_iter.c | 19 +++++++++++++++++++
> >  2 files changed, 38 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/too=
ls/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > index 1a5dc1adae73..c1f81b5dccdc 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > @@ -265,6 +265,23 @@ static void subtest_dmabuf_iter_check_open_coded(s=
truct dmabuf_iter *skel, int m
> >       } while (bpf_map_get_next_key(map_fd, key, key));
> >  }
> >
> > +static void subtest_dmabuf_iter_check_next_after_drain(struct dmabuf_i=
ter *skel)
> > +{
> > +     LIBBPF_OPTS(bpf_test_run_opts, topts);
> > +     int err, fd;
> > +
> > +     fd =3D bpf_program__fd(skel->progs.iter_dmabuf_next_after_drain);
> > +
> > +     err =3D bpf_prog_test_run_opts(fd, &topts);
> > +     if (!ASSERT_OK(err, "test_run_opts err"))
> > +             return;
> > +     if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
> > +             return;
> > +
> > +     /* The test buffers exist, so a restarted iteration would find on=
e */
> > +     ASSERT_EQ(skel->data->next_after_drain, 0, "next_after_drain");
> > +}
> > +
> >  void test_dmabuf_iter(void)
> >  {
> >       struct dmabuf_iter *skel =3D NULL;
> > @@ -315,6 +332,8 @@ void test_dmabuf_iter(void)
> >       }
> >       if (test__start_subtest("open_coded"))
> >               subtest_dmabuf_iter_check_open_coded(skel, map_fd);
> > +     if (test__start_subtest("next_after_drain"))
> > +             subtest_dmabuf_iter_check_next_after_drain(skel);
> >
> >  destroy:
> >       destroy_test_buffers();
> > diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/te=
sting/selftests/bpf/progs/dmabuf_iter.c
> > index 9cbb7442646e..d5421b75c39c 100644
> > --- a/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> > +++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> > @@ -99,3 +99,22 @@ int iter_dmabuf_for_each(const void *ctx)
> >
> >       return 0;
> >  }
> > +
> > +/* Result of a bpf_iter_dmabuf_next() call after the iterator was drai=
ned */
> > +__u64 next_after_drain =3D -1;
> > +
> > +SEC("syscall")
> > +int iter_dmabuf_next_after_drain(const void *ctx)
> > +{
> > +     struct bpf_iter_dmabuf it;
> > +
> > +     bpf_iter_dmabuf_new(&it);
> > +     while (bpf_iter_dmabuf_next(&it))
> > +             ;
> > +
> > +     /* Store the raw value; the verifier would remove a branch on it =
*/
> > +     next_after_drain =3D (__u64)bpf_iter_dmabuf_next(&it);
> > +     bpf_iter_dmabuf_destroy(&it);
> > +
> > +     return 0;
> > +}
>
