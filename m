Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795559123;
	b=K2NddRbRGi2DmG0R7Kf+13umXX8OvLwhKPKduPCeDJXgbD16aBlWTHMOid1npK9i5TCm
	 9nS+QuRJ3p85QR+/0P0F7lIKhGWQUCqcCAj+SVdYbYL4LM+mZbP1osFqfpVtfWCNwkUf6
	 AWks9OrQy9PAb9oEAFMQ4tHpUtEovObaEkdxtHCu+4+Qvz9KeJI8iLTh/thvZj2pPq91P
	 1ZAlAeF+QKhZ4bRv1kdW5MoFrMcCKea+xSerhYHsr9HLsqoJAydbaZu/z7i2eJKErBpfn
	 YmMa+l0Xo6xuTwUbsE7e38yKNbFavVvmLYeUn/3bUyVQixz5GDqfdjX7iwc7fsCqPkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
	b=zXCh1Jw2teCAY64GkBXm8+jNeXTvUyRUeuS5oiM2Rad3WnCoPVpwEr7cl3zbBNDfPwMP
	 pBYFBr6P4Mgwx5+k+Mew8xJAXuz0Ww87p/4V9ORqOlmzg/Gct1NzUg8nREJu75lNy90vh
	 W8CxrpRjanAtnFSdGdGqhrS5Tlje8q5BKO6YB0NaCKxq6MREBZnqIvBNvkbTjw02pYfWX
	 zz2msg9I14q5L8zWK0HiyPyOzKEjq0WuQOsJT64Ietp0N57OCk6oxPTRI5wMBW8u84Vyh
	 5JyIyXgtxDq1ujwJ7AiKgxTp+cxZGL18pIqWSwcN5lO65HiUmluKYQ+XvCD708dHizA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N2GWJCzq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF31606A326
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 22:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N2GWJCzq
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so202385e9.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 14:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795559121; cv=none;
        d=google.com; s=arc-20260327;
        b=hMOhK9JG+Ka+2X8O8x5nTNOXJzy7dRx9rnGTxUX953Ut7H2qg+XhUehIz3OHvEQDmM
         2gidntFgCCzTEsncEJc0WTcd3lRTEx2BXwbCOZnJ/isMydUw0evFWQm0djT93/9Bmpq2
         YhDdh+QVYCa1noWNtvk+njysEJFOKz9cDFqF4oK+9OqClKiw2sQJsuy8NJRcrzogaHUj
         9ePBdv0CPmxE9giB7OvlukZ1ibZptdvHziX4jdUxV4VzJMKKS4H6iJxFiSYl/nWjCPHv
         Jv4A7OCuiwVvWwdTUbgs5Lgayw4+5G54wGVXt0OwGdESvhN0uHl2I0tFBwdKbXTAMDUN
         cd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
        fh=LUndUQARXOeLyeQRNs1yTrCk/v549jtTH+ofD/YIpxo=;
        b=ZeGK+Pm7vz2uhOBXGS6r0giY7vlXbnkdT3H+rCsTxgga/cn2yb2b1qGPOVXDJ7GatL
         ii5mtOAhht64/8SI05VL+EF5j+1LTTPIb8UnCP79s0Ncu9hu93qt79wdP6HVFDHnNVi5
         UBlnWXiRA/J0nm2ZWbzs7Jc1I2bQ01It/5AaFO7UTb31NZVh0AiU2Ouptc1mrtg/1KmL
         AgQpEhBCFf2qCjJmnGXCzQOLNNa/8Y3pzVq5RY/JYWUD7TauZru63JU/woQZrJPtwsHJ
         XwYBqpZ+DOPAMbi4/g0zTUac6EXEyklJDz9Bu/NzgdP17OHfAiQ+P+a4mTTFR7roQDqb
         pHzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559121; x=1796163921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
        b=N2GWJCzqiaMrirNLibPnmyf6tjcUM9DrHFWhPhku4m2GcfQHoAucBnUQahQ2yo4eR8
         2MM3NHLDkcinEXO90EAiFuuY7PYg92givKT2uKNItdPgjQ9efrdnbjT1AFRj/tb6WMVn
         nuhuGPFwiZdJvHl1FarzOz36rHIXx2YpNy1kZ03hj8aT45jNliw3WufRm8bmo8vwUG2u
         IPrJiSXumFtsR741KL2k+F8gd5B7mlmmdu0IgwPbFtNUIOVFIyVVU6rvgd4NwuPjRd2Y
         jtgDUssk+cLci7e7rc9KHIkyftGsbxgKCzngYa+XccuyMygdQWyrsmPCf+TtJE78TTN+
         slKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559121; x=1796163921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EAJKFMsoiiC78zOtAoZbxgMl0cT/7CbdsqUgXu3XoJ8=;
        b=0cV9P4V2kfye6CQ5ZmwNiof48HUSUA7QUBj9FfzzXoxKig5aggJj1PrsCDDGY3ohRR
         o4XFclqqh8uXm9UtLcjaXq1dFG1kFDJSbEAFoU51jrcRAVDAKc7WsVXkMIk8LgiYq5Wf
         hQ1/Lr07kNuXCo1Re0MfcpoKnefNjx3NpvYPFgkJYIGUJiba8Xccp9T0h5665DCUtjcZ
         F7SZGsxE3a3oOwWBmWBT8LJbcnjgjh+6h4V6TUjlG5vsv43JgUliGyqXITVQSChM+ZA5
         3oCt+xgM+JkQiFrr5hDBqcgK9dUQ57HDnKwpAm7CFI+IbZHYpGzXElcY+43KxE6hdYyy
         UudQ==
X-Forwarded-Encrypted: i=1; AL+hErHN9FkhrIxbRYUmEPy0gAHOKUH0xxj56CZvF0GjULN0UgK/cyWbW2fSdcB+Ks2f+cYS1EzFYXiyujPEag==@vger.kernel.org
X-Gm-Message-State: APuU4Z+vEd/tJD4oq4oDgXDwcR8HtGDZGyFZgTyemwypdOFL74sdUQSa
	c2iTuON+p8Q1y4RCfd3IUkiA0fqlgqONP9qxACH/jqObimOIk71suWX7OzUMRpEmyGPmah4mzOd
	XnibAu+d5XVjQuNoTbogySSMkiN5HcAQ5pmwm0xmP
X-Gm-Gg: AZFdTZdKNsCtMUkPFmBWz594swdBf4LW3yUu5an5NdkhY6+F8pXMhipfZHyWxNMzV0b
	o6OsHLK6p8RT2N+3O6bB9RUrwcNj0mhDHHp1eFo+kpuvknwl8FowwFF+JBqwDNy6DQe95cj5Ox1
	ENsNfM2PrK+hdsOtfGT4oxPXdsrTvx28KAxjs4Io0ri3rXWP0Z5SfcH6WbdQd7Swb4xwoEMvIbI
	LNzef6kW9Dq6Zaa7yI+kiOVFx327uJyIpNYW6MLZ39Qs2r+IYt5pErxgkM8NABm7ut1Mj8Te+eb
	OwBR7zAb4B/TArQoagY+b4ZTbs3k6f0SNaaf3F/k0HtwtwmbcRLa1DPZh0kg03yUwxgX0ewIVWv
	zorr6nZKD9xoowBwbrM+JvmpWIjQBYH8/RsWDbrXli4V0BP3BMmts0TTD7P7CevVyBtDDOrfO7O
	y0Cyv0U5qlpy8QLN+MVPLpU6dtzcbUzdeIyeOPCq9cCYA=
X-Received: by 2002:a05:600c:2059:b0:4bb:5a90:8ca4 with SMTP id
 5b1f17b1804b1-4bb9163dd1amr2975305e9.12.1795559120990; Tue, 24 Nov 2026
 14:25:20 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev> <20261123-feat-udmabuf-huge-pfnmap-v2-3-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-3-3254f801fc36@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 14:25:09 -0800
X-Gm-Features: Aa3M54pp6bpRCS8AG4iCULQJGiNccxTku4hoCoX4iAQklO5C46N0ugppOSxDFeI
Message-ID: <CABdmKX3EAHhwSWG+kJrNmyMuCF7uY4rdR6=B8hXX=TFaz==4uw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] selftests/udmabuf: test mapping a huge page backed udmabuf
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philip Yang <Philip.Yang@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Natalie Vock <nat@pixelcluster.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:45=E2=80=AFPM Qiliang Yuan <qiliang.yuan@linux.de=
v> wrote:
>
> udmabuf maps the ranges of a buffer that are backed by huge pages with
> PMDs, provided the mapping covers whole PMDs at an aligned address.
>
> The existing tests of huge page backed buffers only map a few pages, so
> they never get a PMD mapping or check what is read through one.
>
> Map a 64 MiB udmabuf backed by 2 MiB huge pages and read back what was
> written to the memfd, with a different pattern in each huge page: through
> a mapping of the whole buffer, which must be PMD aligned for a 64-bit
> task when THP support is built in, through a mapping at an unaligned
> offset, and from a forked child that inherits the mapping of the whole
> buffer.
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> ---
>  tools/testing/selftests/drivers/dma-buf/udmabuf.c | 97 +++++++++++++++++=
+++++-
>  1 file changed, 96 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/te=
sting/selftests/drivers/dma-buf/udmabuf.c
> index d78aec662586b..6eaef1b3aee01 100644
> --- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> +++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> @@ -14,6 +14,7 @@
>  #include <sys/ioctl.h>
>  #include <sys/syscall.h>
>  #include <sys/mman.h>
> +#include <sys/wait.h>
>  #include <linux/memfd.h>
>  #include <linux/udmabuf.h>
>  #include "kselftest.h"
> @@ -130,6 +131,98 @@ static int compare_chunks(void *addr1, void *addr2, =
off64_t memfd_size)
>         return ret;
>  }
>
> +#define HPAGE_SIZE     (2UL << 20)

This isn't true on 16k or 64k PAGE_SIZE arm64. Can we read
hpage_pmd_size for the PMD alignment and Hugepagesize: from
/proc/meminfo for the MFD_HUGETLB backing size?

> +#define HUGE_BUF_SIZE  (32 * HPAGE_SIZE)

I think we only really need 8 of these for the sub-range test, and
this gets huge for 16k or 64k base pages.

> +/* Check that @len bytes mapped at @addr match @mem at @off */
> +static bool check_huge_mapping(char *addr, char *mem, off_t off, size_t =
len)
> +{
> +       size_t i;
> +
> +       for (i =3D 0; i < len; i +=3D getpagesize()) {
> +               if (addr[i] !=3D mem[off + i])
> +                       return false;
> +       }
> +       return true;
> +}
> +
> +/* Check that @len bytes of @buf at @off read back what was written to @=
mem */
> +static bool check_huge_range(int buf, char *mem, off_t off, size_t len)
> +{
> +       char *addr;
> +       bool ok;
> +
> +       addr =3D mmap(NULL, len, PROT_READ, MAP_SHARED, buf, off);
> +       if (addr =3D=3D MAP_FAILED)
> +               return false;
> +
> +       ok =3D check_huge_mapping(addr, mem, off, len);
> +       munmap(addr, len);
> +       return ok;
> +}
> +
> +/*
> + * Map a udmabuf backed by 2MB huge pages, which can be mapped with PMDs=
, and
> + * read it back from a PMD-aligned address, a sub-range at an unaligned =
offset
> + * and a forked child that inherits the mapping.
> + */
> +static void test_huge_mapping(int devfd)
> +{
> +       struct udmabuf_create create =3D {};
> +       int memfd, buf, status;
> +       bool thp, aligned, ok;
> +       char *mem, *addr;
> +       pid_t pid;
> +       size_t i;
> +
> +       memfd =3D create_memfd_with_seals(HUGE_BUF_SIZE, true);
> +       mem =3D mmap_fd(memfd, HUGE_BUF_SIZE);
> +       /* Give each huge page its own pattern */
> +       for (i =3D 0; i < HUGE_BUF_SIZE; i +=3D getpagesize())
> +               mem[i] =3D (char)(i / getpagesize() + i / HPAGE_SIZE);
> +
> +       create.memfd =3D memfd;
> +       create.size =3D HUGE_BUF_SIZE;
> +       buf =3D ioctl(devfd, UDMABUF_CREATE, &create);
> +       if (buf < 0) {
> +               ksft_test_result_fail("%s: [FAIL,test-8]\n", TEST_PREFIX)=
;
> +               ksft_test_result_skip("%s: [SKIP,test-9]\n", TEST_PREFIX)=
;
> +               goto out;
> +       }
> +
> +       /* The address is only aligned for 64-bit tasks with THP support =
*/
> +       thp =3D sizeof(long) =3D=3D 8 &&
> +             !access("/sys/kernel/mm/transparent_hugepage", F_OK);
> +       addr =3D mmap(NULL, HUGE_BUF_SIZE, PROT_READ, MAP_SHARED, buf, 0)=
;
> +       aligned =3D addr !=3D MAP_FAILED &&
> +                 (!thp || !((unsigned long)addr % HPAGE_SIZE));
> +       ok =3D aligned && check_huge_mapping(addr, mem, 0, HUGE_BUF_SIZE)=
;
> +       if (ok)
> +               ksft_test_result_pass("%s: [PASS,test-8]\n", TEST_PREFIX)=
;
> +       else
> +               ksft_test_result_fail("%s: [FAIL,test-8]\n", TEST_PREFIX)=
;
> +
> +       ok =3D check_huge_range(buf, mem, HPAGE_SIZE + getpagesize(),
> +                             5 * HPAGE_SIZE + 3 * getpagesize());

We should probably also have a test with create.offset =3D getpagesize()
to exercise the misaligned PFN fallback.

Also a test that faults a PMD, then disables THP and then faults
elsewhere to cover the v1 bug.
