Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700565;
	b=ZVCRvBRdI5zbQiXb+hYWERlsqWD361QGGyrXarVK66fVgehO3pNOTyo2TJU7Db6h/ccG
	 LhZ7siq6l/vmQTGrD73zWUk8pFNT7zjn8JGkCrjAoNPf6wNqVIP7TAB8ANwmoBG8iS+9j
	 dMuCbmw9sTANTM9SoaGKrkpZsgXVvRm1nMI0O8BdSIgdVAAo2K1T3iUXzq1QXNRvjfwRD
	 QaLLnKpo5szxGRKdIEtiLBMkAixQERq9UbimdNHQREgHI/CoxL0ywJW1I6wDQOi+VtXFd
	 Nupsxwg7gF6LRKYzN3TLj6DJiiFd4UZS8MN+cJABq3SenB/Xbpl2s7uTDbGJc97EQyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700565;
	h=Received:DKIM-Signature:From:To:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=7UohWGYrgb5unULELNqv7/Zf0JQWouauZ8dcJPMNMyU=;
	b=IfOBPlpFdCJC9flT6y1X32D6NvhVqp96Oi181Q96eYGmveWCALu9zbQ2GqZhnzYX64LJ
	 mGA0DhzePqNCVHUrAGZQMV90f+8mOQiAnDtK0vau3zRASqe2Jihda7yf1ks7AN32Kmmh1
	 8rKc2hT+C0dQ/siTLU6gPDY5GXMuIER/JLB2fbDfA/4eSuwV6hiymPc6OWsZBL4fKV3Q3
	 drUy6UwIZaMOh60NL4wKWdm/N0UKYpCXUO+OomSZWdTFW0+oVxGcpyy1Dew4ERrik3gaC
	 Ni8rOSA9ODHel16YBqDCmojBQMstWme9wOpWY3JC3KhWKh115mwSOjd7nF+lKIH6ESA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HZHh9EV2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DFD606A339
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HZHh9EV2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EE31F000C4;
	Thu, 26 Nov 2026 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700565;
	bh=7UohWGYrgb5unULELNqv7/Zf0JQWouauZ8dcJPMNMyU=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=HZHh9EV2DSvh0w8Qlg9SW0X11H7PBCCiB34Jll+BCCwCckgk5S5LpIEAkYy0jLZxy
	 ZnaTWbUnsD3CDMWj7q8kjs07HTfPtCYcKi0NZrOcE+jj49R4HLS5VK10WS3JPZE/Mf
	 QRlxy4dY8HPYT//mqyncZiCV6Wl4mRwdxj0cdQ6Jmegz5sLB3rgMmTHBPE8U9p+j8Y
	 9yribrZe0WZvJpKA2qzmW1og82BLwkCup+X7bIvZqS2WTTYKliaFXkgZZg0ra8ddRN
	 44aqBOFvf3Zw81ECSFZtyc+rWJ+zK8kIMpfydp4AP2Nb+H2KS94caORox6G74nIpa9
	 rA2dUCQhQN67A==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: linux-media@vger.kernel.org, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: Re: [yavta] [PATCH] COPYING.GPL: Fix license text to match gnu.org
In-Reply-To: <20261104155613.764306-1-mkorpershoek@kernel.org>
References: <20261104155613.764306-1-mkorpershoek@kernel.org>
Date: Thu, 26 Nov 2026 14:42:42 +0100
Message-ID: <xhkdb33snzp2l.fsf@mkorpers-koolstof.csb>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi Laurent,

On Wed, Nov 04, 2026 at 16:56, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:

> When packing this for fedora, rpmlint complains about the license:
>
>   yavta.x86_64: E: incorrect-fsf-address /usr/share/licenses/yavta/COPYING.GPL
>
> Update the license file with the new address. This has been generated
> with the following command:
>
> $ wget https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt \
>        -O COPYING.GPL
>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

I've submitted yavta for inclusion in fedora here:
https://bugzilla.redhat.com/show_bug.cgi?id=2572963#c2

Upon package review, it seems that there are still some discrepancies
with the licensing.

I used "GPL-2.0-only" as licence (because this matches the COPYING.GPL)
file but the yavta code uses "GPL-2.0-or-later" (or GPL-2.0+).

Do you agree that this code is GPL-2.0-or-later?

I do think that the COPYING.GPL is still correct here, since it's only
the license header that changes between
- https://spdx.org/licenses/GPL-2.0-only.html
- https://spdx.org/licenses/GPL-2.0-or-later.html

Thanks
Mattijs

> ---
>  COPYING.GPL | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/COPYING.GPL b/COPYING.GPL
> index d511905c1647..9efa6fbc9628 100644
> --- a/COPYING.GPL
> +++ b/COPYING.GPL
> @@ -1,12 +1,12 @@
> -		    GNU GENERAL PUBLIC LICENSE
> -		       Version 2, June 1991
> +                    GNU GENERAL PUBLIC LICENSE
> +                       Version 2, June 1991
>  
>   Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
> - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> + <https://fsf.org/>
>   Everyone is permitted to copy and distribute verbatim copies
>   of this license document, but changing it is not allowed.
>  
> -			    Preamble
> +                            Preamble
>  
>    The licenses for most software are designed to take away your
>  freedom to share and change it.  By contrast, the GNU General Public
> @@ -56,7 +56,7 @@ patent must be licensed for everyone's free use or not licensed at all.
>    The precise terms and conditions for copying, distribution and
>  modification follow.
>  
> -		    GNU GENERAL PUBLIC LICENSE
> +                    GNU GENERAL PUBLIC LICENSE
>     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
>  
>    0. This License applies to any program or other work which contains
> @@ -255,7 +255,7 @@ make exceptions for this.  Our decision will be guided by the two goals
>  of preserving the free status of all derivatives of our free software and
>  of promoting the sharing and reuse of software generally.
>  
> -			    NO WARRANTY
> +                            NO WARRANTY
>  
>    11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
>  FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
> @@ -277,9 +277,9 @@ YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
>  PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
>  POSSIBILITY OF SUCH DAMAGES.
>  
> -		     END OF TERMS AND CONDITIONS
> +                     END OF TERMS AND CONDITIONS
>  
> -	    How to Apply These Terms to Your New Programs
> +            How to Apply These Terms to Your New Programs
>  
>    If you develop a new program, and you want it to be of the greatest
>  possible use to the public, the best way to achieve this is to make it
> @@ -304,8 +304,7 @@ the "copyright" line and a pointer to where the full notice is found.
>      GNU General Public License for more details.
>  
>      You should have received a copy of the GNU General Public License along
> -    with this program; if not, write to the Free Software Foundation, Inc.,
> -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +    with this program; if not, see <https://www.gnu.org/licenses/>.
>  
>  Also add information on how to contact you by electronic and paper mail.
>  
> @@ -329,8 +328,8 @@ necessary.  Here is a sample; alter the names:
>    Yoyodyne, Inc., hereby disclaims all copyright interest in the program
>    `Gnomovision' (which makes passes at compilers) written by James Hacker.
>  
> -  <signature of Ty Coon>, 1 April 1989
> -  Ty Coon, President of Vice
> +  <signature of Moe Ghoul>, 1 April 1989
> +  Moe Ghoul, President of Vice
>  
>  This General Public License does not permit incorporating your program into
>  proprietary programs.  If your program is a subroutine library, you may
> -- 
> 2.56.0
