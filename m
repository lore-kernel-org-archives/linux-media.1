Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773343;
	b=Fu5TJYBvGfmy7OofiVl363cwHZOSoOkK1P2bZkDF6XEwtfsTGGfspjvHaKJWAa9VQJIP
	 /hQtd24FrK8+LW4n9IaTh5tPMHBOugY399oPeNLcugeQ0KyHTD5Zab9uq/w+D+5jHF+jP
	 956FqQbJ6j//93omFfmOH/Nx987QTJG5Ndxz23Dxwwdz7DRhSMEWB1BFMIjqENsD37uWm
	 EI5a3yEQZsgvYuvn4zirhmE9kKE6zRBeHwVlnG06YrgWCqvFHSiGgKM3icXFR1NHosAwp
	 hHMeJerUQUYdgtvRm4Ofb2/W1mtGdKBQV++FACkE5blxI7p19VuQjpZLT8OCcfFD3VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773343;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=ACxoQP1MF+GzFlqiKuoUajC8aDkgrIQRATa/Cgcdw18=;
	b=XlvLqnB99GyplLFos7VhPIzLGTd7B6w5CYD9aYuvtllagnx1SYEGNJfpaZ6T/YmfzuLN
	 biFIkxwl+jjKRDPiUyCrXlQgEQ5/xTcc5tp6LgIpW58M0J/VW58LRQzHVm7pYe6fWWeDZ
	 hJGLJZHNOHnU6kwqgWvvghC86uD/BoM1XUJ/gXlH0t6p36cN5OozDwcdEe4t5XadW4azP
	 Swic4HoFawvyxu+/3F7+1jZqTennYNMbPOVBaltM4lcqPxqgTTP8SjOkdWKoZKaANrAAn
	 lhVx71qD5BDTdc+X58lpdvacc0GLs/omFXDFT9kHzOGcup1BjsaCOnR4c3Dx5J1HIFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWjyXYBZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61678606A32C;
	Fri, 27 Nov 2026 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWjyXYBZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D851F0089B;
	Fri, 27 Nov 2026 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795773342;
	bh=ACxoQP1MF+GzFlqiKuoUajC8aDkgrIQRATa/Cgcdw18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JWjyXYBZFLodQ2ukOB716EuV2QW6f1pXKynVGgFfPt5HmZeFFlhyjEvpc43jJVJCm
	 PnOC5fU/YFjpdraX5ojxPK0AGcuV/RVDPp6sR8jbR8kd22rMPVUGXnRbI5jbO2/Cvg
	 tLn9mz3lwbmbI2e64+gjagae3S4BSPuVyWixHq0EBv+tHtyJ5f+Zx+H+3s48TBsDYZ
	 3Ucfgr63uKDX3zkX0fmckQjYtlC+LcpncyBl8urhMyr5qHZbwbLwbpuLsdOP5jcOrR
	 6BwmeiCqwEY7aBf2Q5veA7ud9lRorvUBQpllYTR4cRHtxlmB28HhM3An0qHeD00em/
	 A66Ms1ZzG3Mjg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Ling Xu <quic_lxu5@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <20260914104019.492-1-jianping.li@oss.qualcomm.com>
References: <20260914104019.492-1-jianping.li@oss.qualcomm.com>
Subject: Re: [PATCH v4] misc: fastrpc: avoid duplicate DMA mappings in
 fastrpc_create_maps()
Message-Id: <179577334009.9695.7128272976897775662.b4-ty@kernel.org>
Date: Fri, 27 Nov 2026 09:55:40 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 14 Sep 2026 18:40:19 +0800, Jianping Li wrote:
> DMA handles passed as invoke arguments (scalars beyond nbufs) may refer
> to the same dma_buf fd as an input/output buffer argument. Taking an
> extra reference for such DMA handle maps leads to duplicate mappings and
> an unbalanced reference count, since DMA handle maps are released
> separately when the DSP returns the fd through the fdlist.
> 
> Fix this by not taking an extra reference for DMA handle arguments
> (take_ref = false) and tagging them with FASTRPC_MAP_DMA_HANDLE. As
> these maps are borrowed references, fastrpc_get_args() re-validates the
> map via fastrpc_map_lookup() before dereferencing it, so it is not used
> after being freed. fastrpc_put_args() only releases maps flagged as
> FASTRPC_MAP_DMA_HANDLE and clears the flag to guarantee the map is freed
> exactly once.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: avoid duplicate DMA mappings in fastrpc_create_maps()
      commit: d943eec5a618cef0e2ba77b799c6ee27fae873dc

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

