Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677405;
	b=sK3AYcojNIRqr95UGOQyBVh1rBsdVeCS2YkoWf9+MmlH5dNqQL8JVmV0gSrZqcOEI7s5
	 /uj/LVnU0tXanTCQfBkCdJK1AYWKWmF1d6T64Lqb8vuHnxx0/JgpU/X5TJ4deIXCLeTeG
	 89krLT1qvXpn07uFsFPEhxxs6PKGBzc2Q9zWVYLW/VjCZgs44h4FrY0vpVAKL4Kg11Pi1
	 yef9SLC3dlcoPD4O0zo21QT3W6P/nZh7/BS3BGiIeRjmlrdavKjBkJpIdFOijdmLOltg8
	 44GDqF4VXh+2Amltd/81DotaXah9yw4QIv6yxQ2FaBpJYIus0zFp8GJGsCuJ+D31D7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677405;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=A13iVFhKsOqS5BKj17I53QfPWzjsNUiWBaXY5KItOgQ=;
	b=KMw6VBxn1+9uCh7CvkrRTCLA0ketMEPz3zMzvM+I+JjVwSV6CdSthoES7Bu626jZ0VS4
	 BvOIjMB3/NW2C9kKE6nl8ML1YOki0RctULgRI392o9rAZXNNmwy4xv+bBqSTQd3WnSOzN
	 A9V4AasA7tTTKtck1R/PvJN4UwjrIInqqbHBIp2FU4nk+XGJqdfobmNAskQ0P2kw7/TQs
	 g44GUn5o6ifC2TlbZAffpnfNSKYz7SgwXf41Pr1R+KcEZNHEDxId/du1P4toTSBFQrTMJ
	 xy7ed0WymNUoysJ+gCXtIuyMsMr1yicMjjf5NYWsNwhYcieY2MP4hP3ueQxrBQOKJZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=LjJQzD9Z;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA79606A337
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 07:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA79606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=LjJQzD9Z
DKIM2-Signature:  i=1; m=1; t=1795677402;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:mXA3lVvfSv4hgPeOE4jyEjpN7QsA
   LOmOWMKOQNzmmLnFgcYmuJ8KqT/3U5hM47ovZPRWAz1pNPdrPVjDJ3FcsAzMsTEJlB2R1mIVs4M
   Qh3d7ut4eSCOSpfuwE+Sj2R9BN0UC+93JLxbSATgM+6Lx7oadjzTpAxKlkMt4ses5NyXs21Pw/n
   ciNSKu8pLzA6I76ymAnOfxCmMPZsXZf6xPTKCMOzWDdxIiln8GJhy2B2TxFlo3AkINN5piJtGZa
   Yzb9TQgi+HswBGk8M2irlDmq1KjiqOpZeHAgxPLU+7RkV7bLHtlLl+o3HL9FuXN6Twu4QOBbcXo
   BspJ/NWwhxZOwQ==;
Message-Instance:  m=1;
 h=sha256:
   d/qJGz5KCP9yA3Fx105Fqw+cOZ8gYr0OWILTFujTwQU=:
   WhjiKZ+f3Xf0R96skEKz78BsYW5angEWPQfCIkUR2AI=,
  sha512:
   gopQWUwthgGjQJAGA+D32oLis7D7khAwvdL/YpOCYdhBvwUmsejJ6wKAGz2P85FibdH0+iBzjXVdr+v+HlueYA==:
   BEsRCqyPWYj/nIDC5i9cxnZrBKyaMMF9LvTq/u0SbSO6KE71TbeuqJxRpZFBUmR0DrHSf1/YW0RpXhijnJNhng==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795677374; x=1796282174; i=markus.elfring@web.de;
	bh=A13iVFhKsOqS5BKj17I53QfPWzjsNUiWBaXY5KItOgQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LjJQzD9ZbypCbY08aS/yyhTP/mEkPH+l1ysKUedvkqGMghdLwFDdwqY8jXlsni0k
	 EEFGWBblCeOzvcNxstkkDSeygeXfiT9A1aPBSNVNvSyy+yipbzovrycZPqAP7x5jg
	 o+/jL6VzUvzqxKXhNjF8qMIQCl6omQwoRpESzJfD4uygJFti9RarOy9aGMKdVfrbz
	 gbvmZXfvAujnmb++/LL0+x45UoIcYbKo84y8by3zrWxj52x7RqYUnkNw86ivG8EAZ
	 AI1YFRaIMV4J7dHMRlWEoDs91RKTDh97o3DVnbVKOrD6iGCTL/SYelib4A+4bCq6F
	 ssb9dJ6s46Evx133Vw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mfc8o-1yC6z82yFM-00bP3y; Thu, 26
 Nov 2026 08:16:14 +0100
Message-ID: <5ee6ea11-d1f5-4871-ac88-e59fc88cf15e@web.de>
Date: Thu, 26 Nov 2026 08:16:01 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Laux <matthew.laux@gmail.com>, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261125194951.19072-13-matthew.laux@gmail.com>
Subject: Re: [PATCH v8 12/12] media: add driver for StarTech USB3HDCAP
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261125194951.19072-13-matthew.laux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VH5Nvk1Rjl8XYxHDK56TuFsCJNlKjl29lBEsB4GIO/VI/Gp18CL
 i5fb8tSd8FlqVMoPWoow3MgCPrD86ee/Sztak9TP9fcBm8MWP0MUFtk4iqQvVbPQwSYj9Tv
 QcU4dGwMqhZ3XaM2uSN/UaNLebrCWQ3PJVNw33ittKxEHoNDyFlSWecX42EuL+PpQ0B9NT1
 LmcEZRIVQ/Jj2hlmJXhzg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wGK0vbd9Ulk=;nBoUWqdig4ZhNQGyrvHE6Y0CNKw
 Z971sG410+2SbsvgER5yViXqJO/Eea44LK/5AF7uInePLoQ6b5wJXoWV73IOfkgQPjxMI8Nns
 zrG8eD76WG0TSb9cfsdEqvRhy8goC45FKqHLWu984z3LxbnAg3zemfPv1mQIdHyZE7EPTjq9/
 Q2vsB5rvoJF45TpBS8iwpLLS5YtCEjkIuSB+WRSS7GzMeH5gDO6Jgw2vm7EOuZUTo/EofJKX8
 SifuCU1luqBzSAHSsz2YU6unD4PEra1BGQjvt3phM9R9XzPWnInboHLIEvH1svhCFZg1ImsyV
 fOteLUZDs9DeVfwaWKgiq7xd+fuBaCRfL2NmSFMW/B9m59kwDT1dwIJRujCVyMERCjf5zcoxg
 KVT489rtlEtmYiWjIVt6FRCaoqvMSRtQtQ6FmyyQKAjVEnrCeGmSK5UdBvIEjGGpBGOyb3eYR
 k4XO1D//t+cckhv3JqLIbfWkIvfMUQr2PrlUEWhKaBBp7n6TosdCvKqC+vSXpU/XwLJvCHaGG
 3NNQN+oUlqzseSO5Gng6xvq4XO2vR7WeTaPixZnnxOnNxQSkqul79br8raeSZM+8jFgYdaJGM
 5rs+OiT0PRTg+6b8jd2tiwRJwLEKwQE23VPG6QHLqVzFsyI+0OhR7INQG2JSnO4rBVdmEX6ps
 s7v7MCg9hlJxOCLRyIPkCihfQ2gjFnGd8mVz/S+vjuYUh+yVDtIvmaYQNyvStZ4GQLxZ3JJ44
 p6TrIidiug2VhODJP20+tWVow7CE73QMc3jEAYg0IABnVVAcMJlRWoXJYixzZF03FvTDahWUH
 Q02BdUM2pSvWGOpDkBsOvt+G7ptNOhFwslWfYQerORzyMhpsNQ1n9nAS/r611CBf+6T12FM7c
 SI29tHMog/OInrFH2noNJqspusElswAk7VmskYEs4LFIl+HgsUgL69uKdrgvJfY3lTYeW/+0p
 TL0pjmfnE5X039ykXEPN9xsb69oeF058RHh87jRA5EKIWbk1y6Rlv33PVx5iYujrsIHotD85t
 fN56NdbWF4GTjXyUP5M1vTDIaEKChEK+IZGWQX1B6Us/Fdzjkz8y+N/f5dPK/82voNuoddpFw
 3IDY3xn80QWniJbJDKnZ88WahuS8AxS1I19KSFEkUoW6VmpOtqeDBRGpuxyLdL3bjwqHrm5ap
 okdoflY8xsc/0iuqJF0gYpf+VKI1TKyjPU9t3Dc6m3TRuBs7oAWWfKFcNhMrLl9gVyKN8yaOk
 xcRdf0m6Q9JxQNASmBccfd68PeaN6m/YQnCH/yuZ+LXnwAAQdF7Eue6T0JCyrMWsgBHQZObG/
 txAo00adfTU1u/roKEBrm5oSWp9dfuXvw3N/26/CTCNaK+i81Lc1LZw0nj0RL6OTvJU1tYfCS
 zuusmmCVLGqLVt/mACKJbTECKdcKTViGgJUg1vCDfEK9clwvCPkHdC9jZS4IcIcL4wYYeFAeO
 /ykIkUUk1CkvFTmrZzvTTdgLv5Hz/c7ToiRE5IaMPRVXz/U8qCbay3AEWGYkH4p/IeydfDwzX
 7w3JILcOLnhW2LgQIrlzY8GZtoZedvgBTde8AUNt+PtO3j6H78f9tjvkOZ6hyaaH1ZDRUURZt
 O+gllVTET9kLszwYu4OhF0CbbsKMEQ6SN35qNhDcL/ZsoHgOfB5acuGxxkEShiJEmX4Qjr+hX
 tjAe9Tsz0251zMN0VDiPj4ncdzpDLxTiclmfJPat8r8yS+INv+3+dUicqlL8RtZPI1EgLRWYx
 kTwYYMWMZQl8nvLptMXXWQo83fccmaazo3fgvap+orMAtVcGT4/JG4Vv1a4cxl6y0IRXtVZOX
 L4XsASNQFiADB9IZqJ+TXxrLorue8Va68sFkdBAy/WoWVoqdsZwryeOxxnikPUBf6ZQTeJwI+
 5LF/PYaPrNOthm0dcIq0n0k1lAiAM7yfXIJcyJifRYJJ5gVpieiJTYnsCr3vWkw28PakTMPsU
 FWhVa8SLg4uTz6aj1oRj1qUInEX8knmSdyGDHeiPFbIxgvnb13Zya1cssCx4ATnDviPQD4acu
 ijOY2y35S9To1t2YH+C1ucy4mFq7Y8+hgfx4XzwHFhprBAtTwRp2XZhc2Zy4GurplIR7gB7t8
 3oLQtsGinUwR+eJnXwpLAmDL9RgEtLel9S/euqlSYwML3PBe+AYz2u+oiI61VAVnabBOJFaXy
 kAmzeRM4YMFXvooVl1lKnWCHymadNrAo6VXcLGDPZjuKDysAH55bjqoUP/F182AALhpNowc6S
 0vhaGtCDsbfbaqSpT26Jl/yXoyh37EAUVFrKmRzdjnWpK/TcmZyomrcXDmWf/rHPWbnuL0A8n
 OsXXYuUJToa/vgeksXdVEePqvTapjlCpz4tWN76JAi6UsI8LeISwV4pTXklVXAUxq0zldaDEU
 z6XTEKEt7+MSnrQl991CUDcjmfCOy+7Pjnse2HUnUIrMTEvCHWZ/4o0ZAnT9xktOZZP66tddg
 FoS97a6Idsnl5Z3Zyni/S7suhIsTLFvV2IQpYUH15IzoxxaXyjvWt58ZvYKMFb0B27ncffJ8X
 w9pKSeH2hi7OhG42q/bPTc5G4W12jVrRnLI/qZtzNWvKMbruWTs/LHjd5F8Wa6Q9Tiyg+bvq4
 Pkm96b4T/vxuElPqNdEe35NmIMeOEQV5Bpz0bXGTKYAgqmnpsPpHKYUFoQDVp5Uzp/h67jeS2
 91XNpQzqZy9o2dcEyPZwdry0Smv+g02QL5jhinLBCyqh8PJD/7HygncxcEGH8m7SMQXKdUkhH
 f8oK0oDjeluWso5uDhQiiaaKMXMQEGgJbtl95u22SBBBuf5rbkywB3FqXB3jhoPn4bPHDj3qX
 V5iTuZd30/YFYlK0ri/Cn15wrYGQD8vLtorXjOUVvPbMH35sBty3g9SoPf4yHADnDlTKexGSs
 ogT28+JpS2Mj4QMX7++0RLk3JbHHDiiu571dYHJMPkKsJnH3aaVkK8AF20Wl980wNLvLeBD6j
 6DhmCqNRUPDtoFJRG9XT5jHYpcm4P9FLmuLTFm79rZOLtnTdy51RFNGITFni940xzl1Jwdzuy
 uR2F9E5fWYzv3Y6FwnCvb2iYCb09oMcLymZzr7ullMBUMeMTWx+lE1ft+5mrPEz6afuOag8tk
 hraEH81JpzNs1zbO69xdp0BQFrR0xkhZmU7+k0fjkMaC3aocTbowxz+oStUN6mVuuCMwRLH+c
 W01WwTxcEOxEGI//es1L1nPnUhxg8oMQWxVlv1DnmQT+QC4hXWF/CAXIzew60REKo5i03vKeS
 ODKtOfaldBKZ1HitOqL9/8ARkZup/mUW+r8Kb+Rt70t9Stosjwl/X1LRhMrKdxTubCPMSuLrd
 usStxckRSnSTW15HEyWFx7Vq/Ry1Ybl5TijaLmtoEzFKHV7QxGrRP/eJtzH7p+unlx/yO4iuE
 niwx/PYy8FHDvkC/OILPNMfZ63ZqCHt+f6uxzatyDUYCb6dAmwhwc+IJWGGDvP56pU+CuDC+J
 jHd7Gg3/CPaFsc3+6i1QIsHyPq7RZLg+Niqk0lT8iNgiEaLSqUSBAfhThNPpKb2In9kvcNSvK
 zBP3Ainj+1nPxmA9Y5lkp2HCu2QUB4ydDF7CNYlUHIrvTcD+u9omjTiU0NUIH5LSrERJksak7
 zT+hu947WFmQNqLr9Zk83eXr4Dj3O7NFvAcckgFWqi6z77Bi16Q0DxgZQe17WQMm2VZm43WBz
 qK1SbW6BniEChNj9A44cxnkeEm+g/U3A4JN9+j4ixPrK+UcTBRyGrv0r5R52dOk6nKADnrdG/
 2fRyFKX5su1pGBei1esAbR9D69DNxybTK0RnJKox72LQKK6ecsh3CSH0OSSRz1nsFXW+tI3Wz
 2gYmEtZhs+sZaM0KWs/cU/fCi9AQCXQYrHSU5SXu3pNbzZQsy5pr6P+nRYVAEQGDnfXDKiKaX
 obOiKdKD3DyBMzAya2htb58p6Zez3JkdL6ce4CjeavBynInTTMqj3TcUjtvMzw97umIEru04K
 5MHU0WTD7p1CvafMBKtIrLxzHuMhB4+9q55SvTIB1QfO3ritsDsmFEfwjt9h++1dAyWlVf3Lm
 jNFyTHB6BYCLOXH/pGVLp7AI6vz2eI1r2rdW6AsrWU+UctdxQ/cjEqXHn7s5M1CCamKGPst1u
 PvGp+lgle24hNrSmfhvX2XKdoD0xAHyiagZMVgDXmnhCttZob9tj0480Gv0lSkFwigyLhtMBD
 dnyIY0ihq4HD+Up0C0qL/Ae8lQeEjcgEEd4dKFMoeOqec73OYLo91/iGtBViSfujCDd0uqNMz
 LkP1KJSSxkGyR/ZtrJp0Ln5yome+QpY20gaUXpVrKIWEREUAudCyzhjiocc3o1El1ZzBwySEa
 +tF8MrGVottECtxwiNpdAnWehP7DRDzGOBeJo4BvmoFzfV4UO01XqD+YT6Y9du1TNVqSD9Qgj
 1M3Hg+XnegQ7zghbSGmLfTnIXYBCWtsD/17cfT/gxK++V4z3zTnWO915qkMytJsOFaF7yQaRc
 DPEYo1O5ZKVzsc+k40G/RzqTBlPGMHRhNT8AAyVlEAFrplxPyKPspY851i/eM/xdHAr3eCiVe
 aivXHrDBpTcZpWrN9gZ4KzL5Ym+vnT1XRd/pBliisR8K1fFt1GvRlyHS5Zd412nQ1omOZzAmK
 syv/dDpgiqFKUivR/PHQAxqoVSz/CVJdUf6/yIAcYG4sKmKRV7nNBNl/GDuTOqu7EZgo8W5dY
 //V384uvvpiU1E/dIiwDhZ6cxiVK0/2xFd2KHq4ynWo92anQfzGvLz231fdenCZARLpMEqjtP
 3RF+FtdrsuxG3r7EU8crvSNueALm5Ye4S0+RPzGjlwtCNmQjp6/l6ER4zhBhhA/JDumE+2kv7
 4bF8fsBJfziGzjVept9kc2/H1bl232XFBNdaJx4URr6/ZkMM7cS0c5Q30SFqgO7VpdOLdKNRS
 2+jSp0Su2EmL9AG1uGweU4JpntWyR2AHfyfiGoZEVTTOSKqQei4knzy390B+JD4SkJ/ikmumD
 N0tz2GCCryITZwTXcGb47Ifhlvs+hkjwkeC+PJ9QzyUJIyDSH2/Gb6/dNj5PjQDPXjjr/Jgyb
 34Jf7YyglOfnoga640GoSBW5hG7jTEnxdsM3D3+mQdt5ZhnVsdb6gRvPPhmCzO37wvGHNSYtQ
 4HUlQQpmqCsZgGML08/p7pKmD8PivLtmQz5bTu66XJs+Z70PWqo4t7yQGSkPbOW4qoL//AIQc
 LA+IHfUeZObNAOaDGkbQP5AMo/3ez6/anmlfLZmS5sOaU78fTxmsulwSACF1m0S1iTh9nBMAN
 gN3MaF4xfRNiQSZcLvSVjX0pIGELxfBSmbQUOiSzYqsDPxcwggrSKDK1IHHvIRl3fQzbtGvy3
 jzbc0XrX1rXMiUfQBQ2XosarXmMriS/3QWHBZMKNd5ys2lWZwoGe+paS3+UeTZDLvsTMMkNJD
 OiJa7UFKpDFGVVtQnTYy9VxDUyrRNkJoeuM2Ey7kf+16joi/pUSFddnogmbGWhvVcdA6N74po
 uRDJR27/2WCRHkanzgMoG9mfPKM/lpjltcCy9Q88934e8gr2wq6XdjyV4pn8MjQqrrJs6VYFb
 S7EdT1lKHG0zAHGitDQaDzp+6/PyC0AtNMbgDaAKJrQ62wB/CiynQdsg2ycuU4zhXrodFWg4Y
 baREsiOEblvu1hxFjYJUuKxVIFzzGnLqXK7TbCpK8l4f+a4YN23fEakhQ5Y2nxJfTPj1ZMNF8
 bcCnOKqWwridjSufglnu+olURXxv9KEx47BlFi4QFuTH+py08xXX/iYM8nE5y/+GI1U5VWXo4
 mIyc9X1g+mvp6WDGd8uTCWzjcquAGpa8uSex59p1K6DaJTCt1plfPKyqZaeE5Iike+edQ95Y8
 7SU8wiXHJAnqx+sfjjt3D8j7fEZ+xpIdF9JkTucbkFoCAR/B646e+GBGCESNJmotjpdMhhH5X
 JgsCt+T7UdYkwrjs7JqMoipqGMFTLIyppMWq6EoWfzoNgAgY3a/UkVv/ACQcie/67QB1uTY1p
 A5xRFQQOi1igClJakoWWZCje2XQ3paTYpUBjBPSY+0Th6T8/FWweplcD9PHrQ4QlhT8UT7Jfe
 z1sUihhKq0rY+0wD1Eh4lJrr1Od/YhjF04+lYSZd24kb8lwyAYsFEwylfRZqvn3+y5XngSruF
 ES0Q1ScMMU7DK6s6qGcsMCGOvF5Sro4NhZpdA73ZAt231uzW6K9g7O2or5HPjGk+2mNZm0VEn
 DLBz6+A5+/kedeWfxlSTGj1VsXH+22BkSUoKep59Cu4JshguZkwgVbV2JjZsdT7sBUFZwd8sE
 NaPCd2ZNNdjFkO4MLHN6k8NWTAsr1/9hqmrnLQlYH6BWUT4Ok+NKvQaCnAKk+xj4MAFyeWaMw
 tksGfBBk0c1gnPjCyK1KlmaL9eeo9WBW/12qaP5XRwIxPflODShCM9Ihk2VBU3zcx731/FoTa
 37SHiNfayRyQjCpwtXzbZD/STPwdYOn+JiOI68UaLjVEBaRMxgaj7/bBsN+idQ4aXlI/+myu5
 dD+GTmeJP40mpU5t2XfHww15H0Z56zS9cCkmG8GS1R9Zmh4le6Sa124OZxxDaK7XVNIsP7/K3
 KabxgsnPmkN5tpzvMvm4pSYhPmQ4l4MQhKPyvXKFJJY1Z2+klot5Vriy9MXBWFCGjLjR1HCz8
 htJmF2Vk3iZ7syw5PWE01CV+rHrTXDRMgy+34YHNfStfsfMyLS36qiaSEIpsolj3RBTSUQMvs
 E05MNy4hjpgHXvfSSVGyF9Qa+y5wVixKDeicWTfRtpp2iQxvlEp8MHxo9mh183m24YsjjR3QA
 oopPi7dYU7bmK+vXBHHZ/yLauPer+7oCX61wcf8OEtL69msnw22dwOVwMG474J+DDeB4lamhJ
 wmL0rd7bLxLE360sUzj4oFOTsgeBOLJRuGH8JxeQJ2fooIP2y/+dwp6ZcetzT6Df3IP4TeFSd
 KEdSgMR4F6zaMCfQqnq51xy8g/dyExtFuAaOODAstosIAQ/MUBmNdRG1ffjRGDmSGJ5wMlvop
 tTX/E4AqZBVB5ARa/24K0tcrvCMmXoL6t9xhuLksGym/8ypjTHuYBoeuR0Wt3rINFkHs+l1ar
 Aiz1MLKeEuNuGKQyl3bpWs50j6czTbJp1vgEoncdDt5jaLbKCr5UEX6C8hinvSR2Yipysl5qO
 aj0StkVY8YPAgFxmJ39gUzfIztYWU9fOZWAGbOM4d+RSMnCf3QcjynQeGdLxDJ8e8ktgqbeTs
 za6+X5tidee02C2DBNAvHPJpS03wsvCdJ9BpKRUu1oolOH/66aqeTrDrLTntnHCb3BIvHkshI
 AkGvSc7Idi6UGf5Tfp1faGXXQPHTLP6dUMvrJ4V4MiS2iw+MtTNM8BVidAyCHEplvCyqQtvDz
 xe90w+7SyQjNMcTnJuYwz6zmGRY0mZaMQ2guMrX7FmoeivXXHEp4KNVmwE7ky3byv3myY5tnu
 WSG7IKyJC2iGdLE6P9LVYVXzG0csnm4YHfp2nnYzOHBvHbVSEG2ATPOX8UUQmFpfcRhdvergW
 ySvlsChX15LnfTwhcqA==

=E2=80=A6
> +++ b/drivers/media/usb/usb3hdcap/usb3hdcap.h
> @@ -0,0 +1,238 @@
=E2=80=A6
> +/* TW9900 registers */
> +#define TW9900_CSTATUS    0x01
> +#define TW9900_INFORM     0x02
> +#define TW9900_OPFORM     0x03
=E2=80=A6
> +/* CS53L21 registers */
> +#define CS53L21_MIC_PWR_CTL  0x03
> +#define CS53L21_IFACE_CTL    0x04
> +#define CS53L21_ADC_IN_SEL   0x07
=E2=80=A6
> +/* Vendor request codes */
> +#define REQ_I2C    0xc0
> +#define REQ_GPIO   0xc1
> +#define REQ_INIT   0xc2
> +#define REQ_WATCH  0xc6
=E2=80=A6

Would any enumerations become helpful for such constant values?

Regards,
Markus
